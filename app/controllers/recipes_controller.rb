class RecipesController < ApplicationController
  def show
    id, _ = params[:id].split('-')
    @recipe = Recipe.find(id)
    category_id = @recipe.category_id
    @next_recipe = Recipe.where("id > ? AND category_id = ?", @recipe.id, category_id).order(:id).first
    @previous_recipe = Recipe.where("id < ? AND category_id = ?", @recipe.id, category_id).order(id: :desc).first
     @category = @recipe.category
    if @category.present?
      @breadcrumbs = [{ title: 'Home', url: root_path }, { title: 'Catégorie', url: categories_path }, { title: @category.name, url: category_path(@category) }, { title: @recipe.name, url: recipe_path(@recipe) }]
    else
      @breadcrumbs = [{ title: 'Home', url: root_path }, { title: @recipe.name, url: recipe_path(@recipe) }]
    end
  end

  def random
    @recipe = Recipe.order("RANDOM()").first
    redirect_to recipe_path(@recipe)
  end


end
