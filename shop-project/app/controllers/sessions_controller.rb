class SessionsController < ApplicationController

    def login 
        render file:  "app/test-views/sessions/login"
    end

    def create
        # byebug
        flash[:message] = nil
        @user = get_login
        if @user
            session[:user_id] = @user.id
            if @user.class.name == "Traveler"
                redirect_to '/'
            else 
                redirect_to '/sjrdrdgkj'
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