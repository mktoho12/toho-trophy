module Web::Views::Users
  class New
    include Web::View

    def form
      form_for :user, '/users' do
        div class: 'input-field col s12' do
          text_field :nickname
          label :ニックネーム
        end

        div class: 'input-field col s12' do
          label :Eメール
          text_field :email, class: 'form-control'
        end

        div class: 'input-field col s12' do
          label :パスワード
          password_field :password, class: 'form-control'
        end

        div class: 'col s12' do
          submit '登録する', class: 'btn btn-primary'
        end
      end
    end

    def errors
      unless params.valid?
        html.ul do
          params.error_messages.each do |e|
            li e
          end
        end
      end
    end
  end
end
