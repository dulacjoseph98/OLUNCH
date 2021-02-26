class DashboardsController < ApplicationController
  def dashboard
    @pending_events = current_user.pending_events_as_attendee
    @events = current_user.accepted_events_as_attendee + current_user.events.distinct
  end
end
