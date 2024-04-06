class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    id, _ = params[:id].split('-')
    @category = Category.find(id)
    @recipes = @category.recipes.order(:name) if @category
  end
end
