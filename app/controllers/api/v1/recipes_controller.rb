class Api::V1::RecipesController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Recipe.all
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def get_best_recipe
    if (params[:dataCuisine] && params[:dataOccasion].nil?)
      recipes = Recipe.joins(:cuisine).where("cuisines.cuisine IN (?)", params[:dataCuisine]).limit(params[:topRecipe])
    elsif (params[:dataCuisine].nil? && params[:dataOccasion])
      recipes = Recipe.joins(:occasions).where("occasions.occasion IN (?)", params[:dataOccasion]).limit(params[:topRecipe])
    elsif (params[:dataCuisine] && params[:dataOccasion])
      recipes = Recipe.joins(:cuisine).joins(:occasions).where("cuisines.cuisine IN (?) AND occasions.occasion IN (?)", params[:dataCuisine], params[:dataOccasion]).limit(params[:topRecipe])
    else
      recipes = Recipe.limit(params[:topRecipe])
    end
      
    render json: recipes.to_json(include: [:cuisine, :occasions])
  end

  def get_recipe_ingredient
    recipe = Recipe.find(params[:id])

    render json: recipe.to_json(include: [:ingredients])
  end
end