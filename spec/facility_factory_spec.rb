require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @facility = FacilityFactory.new
    end

    describe "#initialize" do
        it 'exists' do
            expect(@facility).to be_a(FacilityFactory)
        end
    end
    describe "#create facilities" do
        it 'can create new facilites' do
            co_facilities = DmvDataService.new.co_dmv_office_locations


            facilities = @facility.create_facilities(co_facilities)

            expect(facilities).to be_an_instance_of(Array)

            expect(facilities[0]).to be_an_instance_of(Facility)
            expect(facilities[0].name).to eq("DMV Tremont Branch")
            #expect(facilities[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(facilities[0].phone).to eq("(720) 865-4600")
            expect(facilities[0].services).to eq([])

            expect(facilities[1]).to be_an_instance_of(Facility)
            expect(facilities[1].name).to eq("DMV Northeast Branch")
            expect(facilities[1].address).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
            expect(facilities[1].phone).to eq("(720) 865-4600")
            expect(facilities[1].services).to eq([])
        end

        it 'can create facilities at multiple locations' do
            #Colorado Offices
            co_facilities = DmvDataService.new.co_dmv_office_locations

            facilities = @facility.create_facilities(co_facilities)

            expect(facilities).to be_an_instance_of(Array)

            expect(facilities[0]).to be_an_instance_of(Facility)
            expect(facilities[0].name).to eq("DMV Tremont Branch")
            #expect(facilities[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(facilities[0].phone).to eq("(720) 865-4600")
            expect(facilities[0].services).to eq([])
        
            #New York Offices
            new_york_facilities = DmvDataService.new.ny_dmv_office_locations


            facilities = @facility.create_facilities(new_york_facilities)

            expect(facilities[0]).to be_an_instance_of(Facility)
            expect(facilities[0].name).to eq("LAKE PLACID")
            #expect(facilities[0].address).to eq("2693 MAIN STREET LAKE PLACID NY 12946")
            expect(facilities[0].phone).to eq(nil)
            expect(facilities[0].services).to eq([])

            #Missouri Offices
            missouri_facilities = DmvDataService.new.mo_dmv_office_locations

            facilities = @facility.create_facilities(missouri_facilities)

            expect(facilities[0]).to be_an_instance_of(Facility)
            expect(facilities[0].name).to eq("Clayton")
            #expect(facilities[0].address).to eq("147 N Meramec Ave Clayton MO 63105")
            expect(facilities[0].phone).to eq("(314) 499-7223")
            expect(facilities[0].services).to eq([])


        end
    end
end