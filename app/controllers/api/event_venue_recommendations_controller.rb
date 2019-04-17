class API::EventVenueRecommendationsController < API::APIController
  def create
    event = Event.find(params[:event_id])
    @recommendation = event.recommendations.build(create_params)
    if @recommendation.save
      redirect_to api_recommendation_path(@recommendation)
    else
      render :error, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(
      recommendation: [
        venue_attributes: [
          :name
        ]
      ]
    )[:recommendation] || {}
  end
end
