class AttendeesController < ApplicationController
  def accept
    @attendee = Attendee.find(params[:id])
    @attendee.accepted!
    redirect_to dashboard_entity_path(@attendee.event.location.entity)
  end

  def decline
    @attendee = Attendee.find(params[:id])
    @attendee.declined!
    redirect_to dashboard_entity_path(@attendee.event.location.entity)
  end

  def create
    @event = Event.find(params[:event_id])
    Attendee.create(user_id: current_user.id, event_id: @event.id, status: 1)
    redirect_to dashboard_entity_path(@event.location.entity)
  end

end
