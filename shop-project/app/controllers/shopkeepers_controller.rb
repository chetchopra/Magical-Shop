class ShopkeepersController < ApplicationController
    before_action :get_shopkeeper, only: [:index, :edit, :update]
    before_action :redirect_user
    def index

        render file: "app/test-views/shopkeepers/index"
    end

    def edit
        @shopitems = @shopkeeper.get_shopinventories
        @allitems = Item.all
        byebug
        render file: "app/test-views/shopkeepers/edit"
    end

    def update
        if @shopkeeper.update(shopkeeper_params)
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
