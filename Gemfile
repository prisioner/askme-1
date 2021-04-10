source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'


gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3'
gem 'uglifier'
gem 'webpacker', '~> 5.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
end
