class Api::V1::CuisinesController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Cuisine.all.reorder('cuisine')
  end

  def create
    cuisine = Cuisine.new(cuisine_params)

    if cuisine.save 
      render json: cuisine, status: 201
    else
      render json: { errors: cuisine.errors}, status: 422
    end
  end

  def show
    respond_with Cuisine.find(params[:id])
  end

  def update
    cuisine = Cuisine.find(params[:id])

    if cuisine.update(cuisine_params)
      render json: cuisine, status: 200
    else
      render json: { errors: cuisine.errors }, status: 422
    end
  end

  def destroy
    cuisine = Cuisine.find(params[:id])
    cuisine.destroy
    head 204
  end

  private
    def cuisine_params
      params.require(:cuisine).permit(:cuisine, :masakan) 
    end
end