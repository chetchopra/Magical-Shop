class SessionsController < ApplicationController

    def login
        render file: "sessions/login"
    end

    def create
        # byebug
        flash[:message] = nil
        @user = get_login
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            if @user.class.name == "Traveler"
                redirect_to traveler_path
            else
                #change redirect to shopkeeper home page
                redirect_to shopkeeper_path
            end
        else
            flash[:message] = "Invalid login. Please try again."
            render file:  "app/test-views/sessions/login"
        end
        # session[:username] = params[:user][:username]
    end

    def destroy
        session.clear
        redirect_to login_path
    end

    private

    def get_login
        @user = Shopkeeper.find_by(shop_name: params[:name])
        if @user == nil
            @user = Traveler.find_by(name: params[:name])
        end
        return @user
    end

end
