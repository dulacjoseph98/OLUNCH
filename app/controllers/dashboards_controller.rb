class DashboardsController < ApplicationController
  def dashboard
    @entity = Entity.find(params[:id])
    @events_as_attendee = @entity.events.joins(:attendees).where(attendees: {user_id:current_user.id })
    @pending_events = @events_as_attendee.upcoming.where(attendees: {status: 'pending' })
    @accepted_events = @events_as_attendee.upcoming.where(attendees: {status: 'accepted' })
    # @pending_events = current_user.pending_events_as_attendee.upcoming
    # @pending_events = @pending_events.where('start_at >= ?', Date.today)
    @events = @accepted_events + current_user.events.upcoming.distinct
  end
end
