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

    if params[:action] == "new"
      editor_value = <<-HTML.strip_heredoc
      <p><strong>00 MIN | FACILE | PERS 0 | 000&deg;c</strong></p>
      <p>Petit texte d'introduction, si besoin</p>
      <p>&nbsp;</p>
      <div class="row">
        <div class="col-lg-6 col-sm-12">Gauche ingredients</div>
        <div class="col-lg-6 col-sm-12">Droite ingredients</div>
      </div>
      <h2 class="wp-block-heading">INGREDIENTS</h2>
      <p>ligne 1<br />ligne 2<br /></p>
      <div class="wp-block-spacer" aria-hidden="true">&nbsp;</div>
      <h2 class="wp-block-heading">PR&Eacute;PARATION</h2>
      <p><em>Ici petit texte astuce si besoin</em></p>
      <p>&nbsp;</p>
      <p>1) </p>
      <p>2) </p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      HTML

      editor :recipe, value: editor_value
    else
      editor :recipe
    end


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
