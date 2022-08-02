class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def create
        @recipe=Recipe.new(recipe_params)
        @recipe.chef=Chef.first
        @recipe.save
        redirect_to recipe_path(@recipe)
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    private
        def recipe_params
            params.require(:recipe).permit(:name, :description)
        end

end