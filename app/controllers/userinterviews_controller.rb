class UserinterviewsController < ApplicationController
    def index
        @userinterview=UserInterview.all
    end
    
    def new
        @user=User.find(session[:user_id])
    end
    
     def create
        @user = User.find(session[:user_id])
        @userinterview = @user.user_interviews.create(userinterview_params)
        redirect_to user_path(@user)
     end
     
    def update
        @user = User.find(session[:user_id])
        
        if @user.update(userinterview_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def show
       @userinterview=UserInterview.find(params[:id])
       
    end
    
    def edit
    end
    
    private
    def userinterview_params
    params.require(:userinterview).permit(:companyname, :url, :interviewdate, :round)
    end
    
end
