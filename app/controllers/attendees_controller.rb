class AttendeesController < ApplicationController
  def accept
    @attendee = Attendee.find(params[:id])
    @attendee.accepted!
    redirect_to dashboard_path
  end

  def decline
    @attendee = Attendee.find(params[:id])
    @attendee.declined!
    redirect_to dashboard_path
  end



end
