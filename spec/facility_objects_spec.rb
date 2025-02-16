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
end