class RideMechanicsController < ApplicationController
  def create
    # ride = Ride.find(params[:ride_id])
    # mechanic = Mechanic.find(params[:mechanic_id])
    # ride_mechanic = RideMechanic.create(ride: ride, mechanic: mechanic)
    RideMechanic.create(ride_mechanic_params)
    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end

  private

  def ride_mechanic_params
    params.permit(:ride_id, :mechanic_id)
  end
end
