class RecipesController < ApplicationController

    before_action :set_recipe, only: [:show, :edit, :update]

    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
        respond_to do |format|
            format.html
            format.json { render json: @locations }
        end 
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.first
        if @recipe.save
          flash.alert = "Recipe was created successfully!"
          redirect_to recipe_path(@recipe)
        else
          render 'new'
        end
      end

    def show

    end

    def new
        @recipe = Recipe.new
    end

    def edit

    end

    def update
        if @recipe.update(recipe_params)
        flash.alert = "Recipe was updated successfully!"
        redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end

    def destroy
        Recipe.find(params[:id]).destroy
        flash.alert = "Recipe deleted successfully"
        redirect_to recipe_path
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        
        def recipe_params
            params.require(:recipe).permit(:name, :description)
        end

end