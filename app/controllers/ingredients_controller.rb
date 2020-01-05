class IngredientsController < ApplicationController
  before_action :logged_in_author
  before_action :correct_author_via
  
  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredients = IngredientCollection.new(ingredients_params, @recipe.id)
    if @ingredients.save
      redirect_to edit_recipe_path(@recipe)
    else
      render "recipes/edit"
    end
  end
  
  private
  
  def ingredients_params
    params.require(:ingredients)
  end
end
