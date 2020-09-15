class API::VenueSuggestionsController < API::APIController
  def create
    event = Event.find(params[:event_id])
    @venue_suggestion = event.venue_suggestions.build(create_params)
    if @venue_suggestion.save
      head :created
    else
      render :error, status: :unprocessable_entitys
    end
  end

  private

  def create_params
    params.permit(venue_suggestion: [:google_place_id])[:venue_suggestion] || {}
  end
end
