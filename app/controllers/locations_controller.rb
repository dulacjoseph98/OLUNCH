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


  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    @entity = Entity.find(params[:entity_id])
    # raise
  end

  def create
    @location = Location.new(location_params)
    @entity = Entity.find(params[:entity_id])
    @location.entity_id = @entity.id
    # raise
    if @location.save
      redirect_to entity_locations_path(@entity)
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :category, :photo)
  end
end
