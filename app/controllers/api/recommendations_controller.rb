class API::RecommendationsController < API::APIController
  def show
    @recommendation = Recommendation.find(params[:id])
  end
end
