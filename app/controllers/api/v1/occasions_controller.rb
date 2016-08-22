class Api::V1::OccasionsController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Occasion.all
  end

  def create
    occasion = Occasion.new(occasion_params)

    if occasion.save 
      render json: occasion, status: 201
    else
      render json: { errors: occasion.errors}, status: 422
    end
  end

  def update
    occasion = Occasion.find(params[:id])

    if occasion.update(occasion_params)
      render json: occasion, status: 200
    else
      render json: { errors: occasion.errors }, status: 422
    end
  end

  def destroy
    occasion = Occasion.find(params[:id])
    occasion.destroy
    head 204
  end

  private
    def occasion_params
      params.require(:occasion).permit(:occasion, :majlis) 
    end
end