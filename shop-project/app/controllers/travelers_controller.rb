class TravelersController < ApplicationController
    before_action :redirect_user, only: [:index, :edit]
    before_action :get_traveler, only: [:index, :edit, :update]
    
    def index
        render file: "app/test-views/travelers/index"
    end 

    def new
        @traveler = Traveler.new()
        render file: "app/test-views/travelers/new"
    end
    
    def create
        @traveler = Traveler.create(name: params[:traveler][:name], job: params[:traveler][:job], traits: params[:traveler][:traits], catchphrase: params[:traveler][:catchphrase], password: params[:traveler][:password], password_confirmation: params[:traveler][:password_confirmation], gold: 100)   
        redirect_to login_path
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

    def shopping
        #show all shopinventories with quantity
        @shopitems = Shopkeeper.first.get_shopinventories
        #show all shopinventories objects
        @show_shopitems = Shopkeeper.first.shopinventories_item
        byebug
        render file: "app/test-views/travelers/shop"
    end

    def cart 
        @shopitems = Shopkeeper.first.get_shopinventories
        @show_shopitems = Shopkeeper.first.shopinventories_item
        render file: "app/test-views/travelers/cart" 
    end 

    private

    def traveler_params
        params.require(:traveler).permit(:name, :job, :traits, :catchphrase, :password, :password_confirmation)
    end

    def get_traveler
        @traveler = Traveler.find(session[:user_id])
    end
end
