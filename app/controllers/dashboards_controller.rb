class DashboardsController < ApplicationController
  def dashboard
    @events = Event.all
  end

  def pending
    
  end
end
