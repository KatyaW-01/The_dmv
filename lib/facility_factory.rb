require './lib/facility'
require 'pry'
class FacilityFactory
    
    def initialize
       
    end


    def create_facilities(facilities,location)
        facilities.map do |facility|
            if location == "Colorado"
                new_facility = Facility.new({
                    name: facility[:dmv_office],
                    address: [facility[:address_li],facility[:address__1],facility[:city],facility[:state],facility[:zip]].join(" "),
                    phone: facility[:phone]
            })
            elsif location == "New York"
                new_facility = Facility.new({
                    name: facility[:office_name],
                    address: [facility[:street_address_line_1],facility[:city],facility[:state],facility[:zip_code]].join(" "),
                    phone: facility[:public_phone_number]
                })
            elsif location == "Missouri"
                new_facility = Facility.new({
                    name: facility[:name],
                    address: [facility[:address1],facility[:city],facility[:state],facility[:zipcode]].join(" "),
                    phone: facility[:phone]
                })
            end
        end
    end

end   
