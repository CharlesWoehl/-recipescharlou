class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    id, _ = params[:id].split('-')
    @category = Category.find(id)
    @recipes = @category.recipes.order(:name) if @category
    if @category.present?
      @breadcrumbs = [{ title: 'Home', url: root_path }, { title: 'Catégorie', url: categories_path }, { title: @category.name, url: category_path(@category) }]
    else
      @breadcrumbs = [{ title: 'Home', url: root_path }]
    end
  end
end
