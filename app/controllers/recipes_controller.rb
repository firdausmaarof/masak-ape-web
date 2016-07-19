class RecipesController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	@recipe = Recipe.new
  end

  def index
  	@recipes = Recipe.all
    if (params[:inputCuisine]=="")
      @recipes = Recipe.joins(:occasions).where(occasions: { id: params[:inputOccasion] })
    elsif (params[:inputOccasion]=="")
      @recipes = Recipe.where("cuisine_id = ?", "#{params[:inputCuisine]}")
    elsif (params[:inputCuisine]!=nil && params[:inputOccasion]!=nil)
      @recipes = Recipe.where("cuisine_id = ?", "#{params[:inputCuisine]}").joins(:occasions).where(occasions: { id: params[:inputOccasion] })
    end
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def create
  	@recipe = Recipe.new(permit_recipe)
  	if @recipe.save
  		flash[:success] = "Success!"
  		redirect_to recipes_path
  	else
  		render 'new'
  	end
  end

  def update
  	@recipe = Recipe.find(params[:id])

  	if @recipe.update(permit_recipe)
  		redirect_to recipes_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@recipe = Recipe.find(params[:id])
  	@recipe.destroy

  	redirect_to recipes_path
  end

  private
  	def permit_recipe
  		params.require(:recipe).permit(:recipe, :resipi, :cuisine_id, :instruction, :arahan, :time, :photo, :rating, occasion_ids:[], ingredient_ids:[])
  	end
end
