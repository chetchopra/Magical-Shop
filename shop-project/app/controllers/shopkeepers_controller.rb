class ShopkeepersController < ApplicationController
    before_action :get_shopkeeper, only: [:index, :edit, :update]
    before_action :redirect_user
    def index

        render file: "app/test-views/shopkeepers/index"
    end 

    def edit
        @shopitems = @shopkeeper.get_shopinventories
        @allitems = Item.all

        render file: "app/test-views/shopkeepers/edit"
    end
    
    def update
        @item_to_update = @shopkeeper.shopinventories.where(item_id: params[:item_id])
        if @item_to_update.empty?
            Shopinventory.create(shopkeeper_id: 1, item_id: params[:item_id], quantity: params[:quantity]) 
        end
        if @item_to_update.update(quantity: (params[:quantity].to_i + @item_to_update.first.quantity))
            redirect_to shopkeeper_path
        else
            redirect_to shopkeeper_edit_path
        end
    end

    private

    def shopkeeper_params
        params.require(:shopkeeper).permit(:shop_name, :password, :password_confirmation)
    end

    def get_shopkeeper
        @shopkeeper = Shopkeeper.find(session[:user_id])
    end

end
