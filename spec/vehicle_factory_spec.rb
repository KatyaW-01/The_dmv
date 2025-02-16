require './lib/dmv_data_service'
require 'spec_helper'
require 'pry'

RSpec.describe VehicleFactory do
    it 'exists' do
        factory = VehicleFactory.new
        
        expect(factory).to be_an_instance_of(VehicleFactory)
    end

    it 'can create vehicles' do
        factory = VehicleFactory.new
        
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations

        vehicles = factory.create_vehicles(wa_ev_registrations)

        expect(vehicles).to be_an_instance_of(Array)

        #testing to make sure my create_vehicles method is pulling data correctly
        #first car created in array:
        expect(vehicles[0]).to be_an_instance_of(Vehicle)
        expect(vehicles[0].vin).to eq("1N4BZ0CP3G")
        expect(vehicles[0].year).to eq(2016)
        expect(vehicles[0].make).to eq("NISSAN")
        expect(vehicles[0].model).to eq("Leaf")
        expect(vehicles[0].engine).to eq(:ev)
        expect(vehicles[0].registration_date).to eq(nil)

        #second car in array:
        expect(vehicles[1]).to be_an_instance_of(Vehicle)
        expect(vehicles[1].vin).to eq("5YJ3E1EB7K")
        expect(vehicles[1].year).to eq(2019)
        expect(vehicles[1].make).to eq("TESLA")
        expect(vehicles[1].model).to eq("Model 3")
        expect(vehicles[1].engine).to eq(:ev)
        expect(vehicles[1].registration_date).to eq(nil)

    end
end