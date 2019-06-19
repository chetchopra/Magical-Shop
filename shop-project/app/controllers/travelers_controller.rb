class TravelersController < ApplicationController
    before_action :get_traveler, only: [:index, :edit, :update]
    def index
        #info that is needed in the travelers home page is here
        @traveler = Traveler.find(session[:user_id])
        render file: "app/test-views/travelers/index"
    end 

    def edit
        render file: "app/test-views/travelers/edit"
    end
    
    def update
        if @traveler.update(traveler_params)
            redirect_to traveler_path
        else
            redirect_to traveler_edit_path
        end
    end

    private

    def traveler_params
        params.require(:traveler).permit(:traits, :catchphrase)
    end

    def get_traveler
        @traveler = Traveler.find(session[:user_id])
    end
    
end
