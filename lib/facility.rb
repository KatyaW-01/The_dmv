require 'date'
require './lib/vehicle'
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
    fees = 0
    @registered_vehicles.each do |vehicle|
      if vehicle.antique?
        fees += 25
      elsif vehicle.elecrtic_vehicle?
        fees += 200
      else
        fees += 100
      return fees
      end
    end
    
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle

  end
  
end
