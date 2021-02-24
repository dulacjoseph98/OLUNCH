class LocationsController < ApplicationController
  def index
    @entity = Entity.find(params[:entity_id])
    @locations = @entity.locations

    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        location_id: location.id
        # infoWindow: render_to_string(partial: "info_window", locals: { location: location })
      }
    end
  end
end
