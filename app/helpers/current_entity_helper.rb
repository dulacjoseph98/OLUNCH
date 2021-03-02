module CurrentEntityHelper

  def current_entity
    if params[:entity_id]
      return Entity.find(params[:entity_id])
    elsif params[:location_id]
      return Location.find(params[:location_id]).entity_id
    else
      return Entity.find(params[:id]) if controller_name == "dashboards"
      return Location.find(params[:id]).entity_id
    end
  end

end