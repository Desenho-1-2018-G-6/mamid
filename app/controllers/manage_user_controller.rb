class ManageUserController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_filter :authorized?

    def index
        @users = User.all
    end

    def update_permission
        @user = User.find(params[:id])
        if @user.user_type
          @actual_type = @user.user_type
        else
          @actual_type = ""
        end

        if params[:action_type] == "add admin"
          @user.update_attributes(
            :user_type => @actual_type + " admin",
            :email_confirmation => @user.email)
        elsif params[:action_type] == "remove admin"
          @actual_type.slice!("admin")
          @user.update_attributes(
            :user_type => @actual_type,
            :email_confirmation => @user.email)            
        elsif params[:action_type] == "add manager"
          @user.update_attributes(
            :user_type => @actual_type + " manager",
            :email_confirmation => @user.email) 
        elsif params[:action_type] == "remove manager"
          @actual_type.slice!("manager")
          @user.update_attributes(
            :user_type => @actual_type,
            :email_confirmation => @user.email) 
        end

        redirect_to manage_user_path
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation, :cpf, :birth_date, :gender, :phone, :user_type)
        end

        def authorized?

          unless current_user != nil and current_user.user_type.include? "admin"
            flash[:error] = "Você não está autorizado a visualizar esta página."
            redirect_to root_path
          end
        end


end
