class Api::V1::TripsController < ApplicationController

  def index
    trips = Trip.where("date = ?", params[:date].to_date).order(:time)

    delay
    render json: trips,:include => {:passenger => {:only => [:name,:mobility,:phone]}}
  end

  def show
    trips = Trip.where(id: params[:uuid])
    delay
    render json: trips,:include => {:passenger => {:only => [:name,:mobility,:phone]}}
  end

  def create
    passenger = Passenger.find_by(name: passenger_params[:name]) || Passenger.create(passenger_params)
    trip = passenger.trips.create(trip_params)
    trips = Trip.where("date = ?", params[:date].to_date).order(:time)

    delay
    render json: trips,:include => {:passenger => {:only => [:name,:mobility,:phone]}}
  end

  def destroy
    trip = Trip.find(params[:uuid])
    trip.delete
  end




  
  private

  def trip_params
    trip = Trip.sanitize_params(params)
    trip
  end

  def passenger_params
    params.require(:passenger).permit(:name,:phone,:mobility)
  end

  def delay
    sleep(0.5)
  end

end
