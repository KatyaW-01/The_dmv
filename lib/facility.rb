require 'date'
require './lib/vehicle'
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :plate_type

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @plate_type = plate_type 
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
    fees = 0
    #if statement to collect fees based on plate type 
  end


  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    #set plate type here
    @registered_vehicles << vehicle



  end
  
end
