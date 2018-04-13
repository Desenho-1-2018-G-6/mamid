class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token if Rails.env.test?
    before_action :not_allow_to_enter_login, only: [:new]

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            if user.admin?
                log_in user
                redirect_to "/admins/"
            else
                log_in user
                redirect_to user
                flash[:success] = 'Log in bem-sucedido!'
            end
        else
            if User.find_by(email: params[:session][:email])
                flash.now[:danger] = 'Invalid password'
            else
                flash.now[:danger] = 'Invalid email or password'
            end
          render 'new'
        end
    end

    def destroy
        if current_user
            log_out
        end
            redirect_to root_path
    end
end
