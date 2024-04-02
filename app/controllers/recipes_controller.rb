class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    category_id = @recipe.category_id
    @next_recipe = Recipe.where("id > ? AND category_id = ?", @recipe.id, category_id).order(:id).first
    @previous_recipe = Recipe.where("id < ? AND category_id = ?", @recipe.id, category_id).order(id: :desc).first
  end

  def random
    @recipe = Recipe.order("RANDOM()").first
    redirect_to recipe_path(@recipe)
  end


end
