class Api::V1::PassengersController < ApplicationController
  

  def index
    passengers = Passenger.all
    render json: passengers
  end

  def create
    passenger = Passenger.create(passenger_params)
    render json: passenger
  end

  def destroy
  end




  

  private 

  def passenger_params
    params.require(:passenger).permit(:name,:phone,:mobility)
  end

end
