class ShopkeepersController < ApplicationController
    before_action :get_shopkeeper, only: [:index, :edit, :update, :destroy, :analytics]
    before_action :redirect_user
    before_action :edit_items_helper, only: [:edit, :update, :destroy, :analytics]



    def index
        render file: "app/test-views/shopkeepers/index"
    end

    def edit
        render file: "app/test-views/shopkeepers/edit"
    end

    def update
        @item_to_update = @shopkeeper.shopinventories.where(item_id: params[:item_id])

        if @item_to_update.empty?
            Shopinventory.create(shopkeeper_id: 1, item_id: params[:item_id], quantity: params[:quantity])
            render file: "app/test-views/shopkeepers/edit"

        elsif @item_to_update.update(quantity: (params[:quantity].to_i + @item_to_update.first.quantity))
            render file: "app/test-views/shopkeepers/edit"

        else
            flash[:message] = "Something went wrong!"
            redirect_to shopkeeper_edit_path
        end
    end

    def destroy
        @shopkeeper.shopinventories.where(item_id: params[:item_id]).first.delete
        render file: "app/test-views/shopkeepers/edit"
    end

    def analytics

        render file: "app/test-views/shopkeepers/analytics"
    end

    
    private

    def shopkeeper_params
        params.require(:shopkeeper).permit(:shop_name, :password, :password_confirmation)
    end

    def get_shopkeeper
        @shopkeeper = Shopkeeper.find(session[:user_id])
    end

    def edit_items_helper
        @shopitems = @shopkeeper.get_shopinventories
        @allitems = Item.all
    end

end
