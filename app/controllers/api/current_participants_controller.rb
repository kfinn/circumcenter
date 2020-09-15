class API::CurrentParticipantsController < API::APIController
  def update
    event = Event.find params[:event_id]
    @current_participant = event.participants.find_or_initialize_by(visitor: current_visitor)
    @current_participant.assign_attributes(update_params)
    if @current_participant.save
      head :created
    else
      render :error, status: :unprocessable_entity
    end
  end

  private

  def update_params
    params.permit(current_participant: [:name, :latitude, :longitude])[:current_participant] || {}
  end
end
