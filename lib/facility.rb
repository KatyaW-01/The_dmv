require 'date'
require 'pry'
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
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle

  end
  def registration_date
    @registered_vehicles.each do |vehicle|
      if @registered_vehicles.include?(vehicle)
        @registration_date = Date.today
      end
    @registration_date
    
    end
  end
  
end
