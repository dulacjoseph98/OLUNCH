class LocationsController < ApplicationController
  def index
    @entity = Entity.find(params[:entity_id])
    @locations = @entity.locations
  end
end
