class ChefsController < ApplicationController


    def index
        @chefs=Chef.all
    end


    def new
        @chef=Chef.new
    end

    def create 
        @chef = Chef.new(chef_params)
        if(@chef.save)
            flash.alert = "Welcome #{@chef.chefname} to MYrecipes App"
            redirect_to chef_path(@chef)
        else
            render 'new'
        end
    end

    def show

        @chef = Chef.find(params[:id])

    end


    def edit
        @chef = Chef.find(params[:id])
    end

    def update
        @chef = Chef.find(params[:id])
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


end