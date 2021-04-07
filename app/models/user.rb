require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')
  # regexp for username validation
  VALID_USERNAME_REGEXP = /\A\w+\z/

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  # email validation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # username validation
  validates :username, format: { with: VALID_USERNAME_REGEXP }
  # username maximum length validation
  validates :username, length: { maximum: 40 }
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_validation :username_downcase, :email_downcase
  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase) # finding person via email

    # we compare the password hashes, not the real passwords! we do not keep password in DB
    return nil unless user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(
                                                                  password, user.password_salt, ITERATIONS,
                                                                  DIGEST.length, DIGEST
                                                                ))
  end

  # binary string to HEX
  def self.hash_to_string(password_hash)
    password_hash.unpack1('H*')
  end

  def encrypt_password
    return unless password.present?

    # 'salt' creating
    self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

    # password hash creating
    self.password_hash = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(password, password_salt, ITERATIONS, DIGEST.length, DIGEST)
    )
  end

  private

  def username_downcase
    self.username = username&.downcase
  end

  def email_downcase
    self.email = email&.downcase
  end
end
