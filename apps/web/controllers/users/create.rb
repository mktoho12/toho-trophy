require 'bcrypt'

module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:nickname).filled(:str?)
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      user = User.new(params[:user])
      if not params.valid?
        self.body = render_new_view
      elsif duplicated?(user.email)
        halt 422, 'email is used by other user.'
      else
        @user = user_repository.create(user)
      end
    end

    private

    def user_repository
      @user_repository ||= UserRepository.new
    end

    def duplicated?(email)
      user_repository.find_by_email(email) != nil
    end

    def render_new_view
      Web::Views::Users::New.render params: params, format: format
    end
  end
end
