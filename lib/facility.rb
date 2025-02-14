require 'date'
require './lib/vehicle'
require 'pry'
class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees
              

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @plate_type = nil
    
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
      @registered_vehicles << vehicle
    end
  end 

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.permit? == true && registrant.age >= 16
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written] == true 
        registrant.license_data[:license] = true
      else
        false
      end
    else
      false
    end
  end
  
end
