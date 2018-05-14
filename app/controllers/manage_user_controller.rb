class ManageUserController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end


    def update
        respond_to do |format|
            if @user.update(user_params)
              format.html { redirect_to @user, notice: 'User was successfully updated.' }
              format.json { render :show, status: :ok, location: @user }
            else
              format.html { render :edit }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
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


end
