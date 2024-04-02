class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes.order(:name)
  end
end
