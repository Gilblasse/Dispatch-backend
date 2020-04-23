class Trip < ApplicationRecord
    belongs_to :passenger





    def self.sanitize_params(params)
        startingPoint = {startLocation: params.require(:trip).permit(:start=>[:location,:lat,:lng]).to_h[:start].to_json}
        endingPoint = {endLocation: params.require(:trip).permit(:end=>[:location,:lat,:lng]).to_h[:end].to_json}
        trip = params.require(:trip).permit(:date, :time, :riders, :stairs, :notes).to_h
        
        trip.merge(startingPoint).merge(endingPoint)
    end


end