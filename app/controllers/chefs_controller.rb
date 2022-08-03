class ChefsController < ApplicationController

    before_action :set_chef, only: [:show, :edit, :update]

    def index
        @chefs=Chef.all
    end


    def new
        @chef=Chef.new
    end

    def create 
        @chef = Chef.new(chef_params)
        if(@chef.save)
            session[:chef_id] = @chef.id
            flash.alert = "Welcome #{@chef.chefname} to MYrecipes App"
            redirect_to chef_path(@chef)
        else
            render 'new'
        end
    end

    def show

    end


    def edit

    end

    def update
        if @chef.update(chef_params)
            flash.alert = "Your account was updated"
            redirect_to @chef
        else
            render 'edit'
        end
    end


    def destroy
        #@chef = Chef.find(params[:id])
        #@chef.destroy
        Chef.find(params[:id]).destroy
        flash.alert = "chef and his recipes have been deleted"
        redirect_to chefs_path
    end

    private
    def chef_params
        params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end


    def set_chef
        @chef = Chef.find(params[:id])
    end

end