class SessionsController < ApplicationController

    def new
    
    end


    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id
            flash.alert = "successfully logged in"
            redirect_to chef
        else
            flash.now.alert = "there was something wrong with the login info"
            render 'new'
        end

    end



    def destroy
        session[:chef_id] = nil
        flash.alert = "you have logged out"
        redirect_to root_path
    end















end