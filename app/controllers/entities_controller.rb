class EntitiesController < ApplicationController
  def index
    @entities = current_user.entities
  end
end
