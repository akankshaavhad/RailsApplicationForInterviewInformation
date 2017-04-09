class UsersController < ApplicationController
    def new
     @user=User.new
    end
    
    def index
        @user=User.find(session[:user_id])
        
    end
    
    def create 
     @user = User.new(user_params)
        if @user.save
            print "vdfvv"
            session[:user_id] = @user.id 
            redirect_to @user 
        else 
            redirect_to '/signup' 
        end 
    end
   
    private
    def user_params
    params.require(:user).permit(:firstname, :lastname, :emailid,:username, :password)
    end
end