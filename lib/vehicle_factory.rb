require './lib/vehicle'
require 'pry'
class VehicleFactory
    def initialize

    end

    def create_vehicles(vehicle_registration)
        vehicle_registration.map do |registration|
            new_vehicle = Vehicle.new({vin: registration[:vin_1_10], year: registration[:model_year], make: registration[:make], model: registration[:model], engine: :ev})
        end
      
        

    end
end