class RideMechanicsController < ApplicationController
  def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:mechanic_id])
    ride_mechanic = RideMechanic.create(ride: ride, mechanic: mechanic)

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
