class TravelersController < ApplicationController

    def index
        #info that is needed in the travelers home page is here
        # byebug
        @traveler = Traveler.find(session[:user_id])
        render file: "app/test-views/travelers/index"
    end 
    
end
