require 'spec_helper'

RSpec.describe FacilityObjects do
    before(:each) do
        @facility = FacilityObjects.new
    end

    describe "#initialize" do
        it 'exists' do
            expect(@facility).to be_a(FacilityObjects)
        end
    end
    describe "#create facilities" do
        it 'can create new facilites' do
            co_facilities = DmvDataService.new.co_dmv_office_locations

            facilities = @facility.create_facilities(co_facilities)

            expect(facilities).to be_an_instance_of(Array)

            expect(facilities[0]).to be_an_instance_of(Facility)
            expect(facilities[0].name).to eq("DMV Tremont Branch")
            expect(facilities[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
            expect(facilities[0].phone).to eq("(720) 865-4600")
            expect(facilities[0].services).to eq([])
        end
    end
end