class TravelersController < ApplicationController
    before_action :redirect_user, only: [:index, :edit]
    before_action :get_traveler, only: [:index, :edit, :update, :purchase]

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
        # byebug
        render file: "app/test-views/travelers/shop"
    end

    def cart 
        @shopitems = Shopkeeper.first.get_shopinventories
        @show_shopitems = Shopkeeper.first.shopinventories_item
        render file: "app/test-views/travelers/cart" 
    end 

    # t.integer "quantity"
    # t.integer "traveler_id"
    # t.integer "item_id"

    def purchase 
        #updates traveler inventory 
        #creates a transaction 
        @quantity = params[:quantity].to_i
        @item_id = params[:item_id]
        @item_to_update = @traveler.travelerinventories.where(item_id: @item_id)
        @item = Item.find(@item_id)
        @total_cost = @item.cost * @quantity
        @shopkeeper = Shopkeeper.first
        @shop_quantity_record = @shopkeeper.shopinventories.where(item_id: @item_id).first
        @shop_quantity = @shop_quantity_record[:quantity]

                
        if @item_to_update.empty?

            if isValidTransaction?
                #subract traveler gold
                @traveler.gold = @traveler.gold - @total_cost
                @traveler.update(gold: @traveler.gold)

                #subract shopkepper quantity
                @shop_quantity = @shop_quantity - @quantity
                @shop_quantity_record.update(quantity: @shop_quantity)
                
                #add quantity to traveler item
                Travelerinventory.create(traveler_id: @traveler.id, item_id: params[:item_id], quantity: params[:quantity])


            else  
                flash[:message] = "Insufficent Gold!"
                redirect_to traveler_path
            end
        
        elsif @item_to_update.update(quantity: (params[:quantity].to_i + @item_to_update.first.quantity)) && isValidTransaction?
            #traveler gold -
            @traveler.gold = @traveler.gold - @total_cost
            @traveler.update(gold: @traveler.gold)

            #subract shopkepper quantity
            @shop_quantity = @shop_quantity - @quantity
            @shop_quantity_record.update(quantity: @shop_quantity)

            redirect_to traveler_path
        else
            flash[:message] = "Something went wrong!"
            redirect_to traveler_edit_path
        end

    end

    private

    def traveler_params
        params.require(:traveler).permit(:name, :job, :traits, :catchphrase, :password, :password_confirmation)
    end

    def get_traveler
        @traveler = Traveler.find(session[:user_id])
    end

    def isValidTransaction?
        return @traveler.gold >= @total_cost && @quantity <= @shop_quantity
    end
end
