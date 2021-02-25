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
    @event.save
    redirect_to entity_locations_path(@location.entity)
    params[:invitations][:attendees].reject(&:blank?).each do |attendee_id|
      Attendee.create(user: User.find(attendee_id.to_i), event: @event)
    end
  end
  

  private


  def events_params
    params.require(:event).permit(:name, :created_at, :public, :capacity)
  end

end
