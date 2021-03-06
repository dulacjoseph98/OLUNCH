class LocationsController < ApplicationController
  def index
    @entity = Entity.find(params[:entity_id])
    @locations = @entity.locations

    if params[:query].present?
      @locations = @locations.search_by_category(params[:query])
    else
      @Locations
    end

    @markers = @locations.geocoded.map do |location|

      if location.bar?
        if location.today_public_events.present?
          image_url = 'marker-beer-event.png'
        else
          image_url = 'marker-beer.png'
        end
      else
        if location.today_public_events.present?
          image_url = 'marker-food-event.png'
        else
          image_url = 'marker-food.png'
        end
      end

    {
      lat: location.latitude,
      lng: location.longitude,
      location_id: location.id,
      image_url: helpers.asset_url(image_url)
    }
    end

    @entity_marker = {
      lat: @entity.latitude,
      lng: @entity.longitude,
      location_id: @entity.id
    }
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
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
    params.require(:location).permit(:name, :address, :category, :photo, :bar)
  end
end
