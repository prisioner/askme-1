class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Boris',
        username: 'knmrftw',
        avatar_url: 'https://sun9-19.userapi.com/impg/cZw_176NEmdmGY79DqzpCCfCoBrXTU0gkybeEg/QTqkdPjh-FY.jpg?size=150x150&quality=96&sign=bc9ec073ed6c3839cb5f345ee225162b&type=album'
      ),
      User.new(
        id: 2,
        name: 'User2',
        username: 'user2username',
        avatar_url: 'https://sun9-50.userapi.com/impg/HXy7AnUbpB5CRl4K0LDQQPp7HGY62ezmbZguFQ/6W_hQUXodts.jpg?size=234x215&quality=96&sign=ab32bdb6be24f3ba6b3246acb6f28ee9&type=album'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Boris',
      username: 'knmrftw',
      avatar_url: 'https://sun9-19.userapi.com/impg/cZw_176NEmdmGY79DqzpCCfCoBrXTU0gkybeEg/QTqkdPjh-FY.jpg?size=150x150&quality=96&sign=bc9ec073ed6c3839cb5f345ee225162b&type=album'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('05.04.2021')),
      Question.new(text: 'Что нового?', created_at: Date.parse('05.04.2021'))
    ]

    @new_question = Question.new
  end
end
