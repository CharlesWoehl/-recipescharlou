class AddRecipeToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :recipe, :text
  end
end
