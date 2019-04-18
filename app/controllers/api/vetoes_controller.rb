class API::VetoesController < API::APIController
  def show
    @veto = Veto.find(params[:id])
  end

  def create
    venue_suggestion = VenueSuggestion.find(params[:venue_suggestion_id])
    @veto = venue_suggestion.vetoes.build
    if @veto.save
      head :created
    else
      render :error, status: :unprocessable_entity
    end
  end
end
