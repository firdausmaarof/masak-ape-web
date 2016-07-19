class CuisinesController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	@cuisine = Cuisine.new
  end

  def index
  	@cuisines = Cuisine.all
  end

  def show
  	@cuisine = Cuisine.find(params[:id])
  end

  def edit
  	@cuisine = Cuisine.find(params[:id])
  end

  def create
  	@cuisine = Cuisine.new(permit_cuisine)
  	if @cuisine.save
  		flash[:success] = "Success!"
  		redirect_to cuisines_path
  	else
  		flash[:error] = @cuisine.errors.full_messages
  		redirect_to new_cuisine_path
  	end
  end

  def update
  	@cuisine = Cuisine.find(params[:id])

  	if @cuisine.update(permit_cuisine)
  		redirect_to @cuisine
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@cuisine = Cuisine.find(params[:id])
  	@cuisine.destroy

  	redirect_to cuisines_path
  end

  private
  	def permit_cuisine
  		params.require(:cuisine).permit(:cuisine, :masakan)
  	end
end
