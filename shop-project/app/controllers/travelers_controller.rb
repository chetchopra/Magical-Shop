class TravelersController < ApplicationController

  def index
    @travelers = Traveler.all
  end
end
