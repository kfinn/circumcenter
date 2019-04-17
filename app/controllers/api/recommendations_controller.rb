class API::RecommendationsController < API::APIController
  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def create
    event = Event.find(params[:event_id])
    venue = Venue.find(params[:venue_id])
    @recommendation = Recommendation.new({ event: event, venue: venue })
    if @recommendation.save
      head :created
    else
      render :error, status: :unprocessable_entity
    end
  end
end
