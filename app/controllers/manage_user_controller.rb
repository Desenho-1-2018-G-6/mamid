class ManageUserController < ApplicationController

    def index
        @users = User.all
    end
    


end
