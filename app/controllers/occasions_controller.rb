class OccasionsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	@occasion = Occasion.new
  end

  def index
  	@occasions = Occasion.all
  end

  def show
  	@occasion = Occasion.find(params[:id])
  end

  def edit
  	@occasion = Occasion.find(params[:id])
  end

  def create
  	@occasion = Occasion.new(permit_occasion)
  	if @occasion.save
  		flash[:success] = "Success!"
  		redirect_to occasions_path
  	else
  		flash[:error] = @occasion.errors.full_messages
  		redirect_to new_occasion_path
  	end
  end

  def update
  	@occasion = Occasion.find(params[:id])

  	if @occasion.update(permit_occasion)
  		redirect_to occasions_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@occasion = Occasion.find(params[:id])
  	@occasion.destroy

  	redirect_to occasions_path
  end

  private
  	def permit_occasion
  		params.require(:occasion).permit(:occasion, :majlis)
  	end
end
