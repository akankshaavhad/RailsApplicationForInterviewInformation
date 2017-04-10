class UserinterviewsController < ApplicationController
    def index
        @userinterviews=UserInterview.all
    end
    
    def new
        @userinterview=UserInterview.new()
    end
    
    def show
       @userinterview=UserInterview.find(params[:id])
    end
    
    def create
        @user = User.find(session[:user_id])
        @userinterview = @user.user_interviews.create(userinterview_params)
        redirect_to '/users'
    end
     
    def edit
        @userinterview=UserInterview.find(params[:id])
    end
    
    def update
       @userinterview=UserInterview.find(params[:id])
        if @userinterview.update(userinterview_params)
            redirect_to '/users'
        else
            render 'edit'
        end
    end
    
    
    def destroy
    @userinterview =UserInterview.find(params[:id])
    @userinterview.destroy
    
    redirect_to '/users'
    end
   
    
    private
    def userinterview_params
    params.require(:user_interview).permit(:companyname, :url, :interviewdate, :round)
    end
    
end
