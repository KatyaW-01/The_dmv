require 'spec_helper'
require 'pry'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#vehicle registration' do
    it 'can add services' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end

    it 'has a registration date' do
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'has an array of registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'can collect fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can register vehicles at facility_1' do
      @facility_1.add_service('Vehicle Registration')

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)
      
    end

    it 'can register multiple cars at facility_1' do
      @facility_1.add_service('Vehicle Registration')
      
      expect(@facility_1.services).to eq(['Vehicle Registration'])

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq(100)

      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz,@camaro])
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.collected_fees).to eq(125)

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz,@camaro,@bolt])
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.collected_fees).to eq(325)
      
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.collected_fees).to eq(0)
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end
end
