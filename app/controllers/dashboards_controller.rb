class DashboardsController < ApplicationController
  def dashboard
    @pending_events = current_user.pending_events_as_attendee.upcoming
    # @pending_events = @pending_events.where('start_at >= ?', Date.today)
    @events = current_user.accepted_events_as_attendee.upcoming + current_user.events.upcoming.distinct
  end
end
