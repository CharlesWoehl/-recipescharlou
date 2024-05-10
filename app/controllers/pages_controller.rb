class PagesController < ApplicationController
  def index
    if params[:section] == 'liste'
      @recipes = Recipe.all.order("name ASC")
    else
      @recipes_by_letter = Recipe.all.group_by { |recipe| recipe.name[0].upcase }
      .sort_by { |letter, _recipes| letter }
    end
  end


  def recherche
    # Vérifiez si le paramètre de requête `query` est présent dans l'URL
    if params[:query].blank? || params[:controller] == 'recipes' && params[:action] == 'search'
      @recipes = Recipe.order("RANDOM()")
    else
      @recipes = Recipe.where("name ILIKE ? OR recipe ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end
end
