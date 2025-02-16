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
        #binding.pry
        wa_ev_registrations = DmvDataService.new.wa_ev_registrations
        factory.create_vehicles(wa_ev_registrations)

    end
end