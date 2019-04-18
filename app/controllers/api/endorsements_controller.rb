class API::EndorsementsController < API::APIController
  def create
    venue_suggestion = VenueSuggestion.find(params[:venue_suggestion_id])
    @endorsement = venue_suggestion.endorsements.build
    if @endorsement.save
      head :created
    else
      render :error, status: :unprocessable_entity
    end
  end
end
