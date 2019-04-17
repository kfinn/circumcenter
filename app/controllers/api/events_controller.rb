class API::EventsController < API::APIController
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(create_params)
    if @event.save
      redirect_to api_event_path(@event)
    else
      render :error, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(event: [:start])[:event] || {}
  end
end
