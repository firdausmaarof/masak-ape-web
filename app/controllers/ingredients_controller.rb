class IngredientsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	@ingredient = Ingredient.new
  end

  def index
  	@ingredients = Ingredient.all
  end

  def show
  	@ingredient = Ingredient.find(params[:id])
  end

  def edit
  	@ingredient = Ingredient.find(params[:id])
  end

  def create
  	@ingredient = Ingredient.new(permit_ingredient)
  	if @ingredient.save
  		flash[:success] = "Success!"
  		redirect_to ingredients_path
  	else
  		flash[:error] = @ingredient.errors.full_messages
  		redirect_to new_ingredient_path
  	end
  end

  def update
  	@ingredient = Ingredient.find(params[:id])

  	if @ingredient.update(permit_ingredient)
  		redirect_to @ingredient
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@ingredient = Ingredient.find(params[:id])
  	@ingredient.destroy

  	redirect_to ingredients_path
  end

  private
  	def permit_ingredient
  		params.require(:ingredient).permit(:ingredient, :ramuan)
  	end
end
