class API::EventVenueRecommendationsController < API::APIController
  def create
    event = Event.find(params[:event_id])
    @event_venue_recommendation = event.build_venue_recommendation(create_params)
    if @event_venue_recommendation.save
      head :created
    else
      render :error, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(
      event_venue_recommendation: [
        recommendation_attributes: [],
        venue_attributes: [:name]
      ]
    )[:event_venue_recommendation] || {}
  end
end
