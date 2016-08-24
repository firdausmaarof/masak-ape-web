class Api::V1::RecipesController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Recipe.all
  end

  def show
    recipe = Recipe.find(params[:id])

    render json: recipe.to_json(include: :ingredients)
  end

  def get_best_recipe
    if (params[:cuisine] && params[:occasion].nil?)
      recipes = Recipe.joins(:cuisine).where("cuisines.cuisine IN (?)", params[:cuisine]).limit(params[:topRecipe])
    elsif (params[:cuisine].nil? && params[:occasion])
      recipes = Recipe.joins(:occasions).where("occasions.occasion IN (?)", params[:occasion]).limit(params[:topRecipe])
    elsif (params[:cuisine] && params[:occasion])
      recipes = Recipe.joins(:cuisine).joins(:occasions).where("cuisines.cuisine IN (?) AND occasions.occasion IN (?)", params[:cuisine], params[:occasion]).limit(params[:topRecipe])
    else
      recipes = Recipe.limit(params[:topRecipe])
    end
      
    render json: recipes.to_json(include: [:ingredients])
  end

  def get_recipe_ingredient
    recipe = Recipe.find(params[:id])

    render json: recipe.to_json(include: [:ingredients])
  end

  def get_fav_recipe
    recipes = Recipe.where("id IN (?)", params[:dataFavRecipe])

    render json: recipes.to_json(include: :ingredients)
  end

  def save_rating
    recipe = Recipe.find(params[:dataRecipeId])
    recipe.rating = params[:dataRating]
    if recipe.save 
      render json: recipe, status: 201
    else
      render json: { errors: recipe.errors}, status: 422
    end
  end
end