class UserinterviewsController < ApplicationController
    def index
     @userinterviews=User.all
    end
    
    def show
       # @article=Article.find(session[:user_id])
    end
    
    def edit
    end
    
end
