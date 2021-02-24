class LocationsController < ApplicationController

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
