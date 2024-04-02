Trestle.resource(:recipes) do
  menu do
    item :recipes, icon: "fa fa-pizza-slice"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :description
    column :category
  end


  form do |recipe|
    text_field :name
    text_area :description, label: "Description courte", rows: 2
    editor :recipe
    select :category_id, Category.all, { label: "Category" }
    file_field :photo
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  params do |params|
    params.require(:recipe).permit(:name, :description, :category_id, :photo, :recipe)
  end
end
