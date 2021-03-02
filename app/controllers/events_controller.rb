class EventsController < ApplicationController
  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @location = Location.find(params[:location_id])
    @event = Event.new(events_params)
    @event.user = current_user
    @event.location = @location
    if @event.save
      params[:invitations][:attendees].reject(&:blank?).each do |attendee_id|
        Attendee.create(user: User.find(attendee_id.to_i), event: @event)
      end
      redirect_to entity_locations_path(@location.entity)
    else
      render :new
    end
  end

  # def show
  #   @event = Event.find(events_params[:id])
  # end

  private

  def events_params
    params.require(:event).permit(:name, :start_at, :public, :capacity)
  end
end
