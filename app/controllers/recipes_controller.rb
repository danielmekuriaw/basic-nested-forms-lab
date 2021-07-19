class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    #@recipe.ingredients.build
    #@recipe.ingredients.build(quantity: "1 cup")
    #@recipe.ingredients.build(quantity: "1 tablespoon")
  end

  def create
    @recipe = Recipe.create(recipe_params)
    puts @recipe
    puts recipe_params

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
      params.require(:recipe).permit(:title, ingredients: [:name, :quantity])
  end 
end
