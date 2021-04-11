class UsersController < ApplicationController

  include UsersHelper

  before_action :load_user, except: %i[index create new]
  before_action :authorize_user, except: %i[index create new show]
  after_action :log_in_user, only: :create

  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def edit

  end

  def create
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?

    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь зарегистрирован'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'Профиль пользователя отредактирован'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def log_in_user
    User.authenticate(user_params[:email], user_params[:password])
    session[:user_id] = @user.id
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url, :profile_background_color)
  end
end
