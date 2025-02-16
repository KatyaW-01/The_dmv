require './lib/facility'
class FacilityFactory
    
    def initialize
       
    end

    def create_facilities(facilities)
        facilities.map do |facility|
            new_facility = Facility.new({
                name: facility[:dmv_office] || facility[:office_name] || facility[:name], 
                address: [facility[:address_li],facility[:address__1],facility[:city],facility[:state],facility[:zip]].join(" ") || [facility[:street_address_line_1],facility[:city],facility[:state],facility[:zip_code]].join(" ") || [facility[:address1],facility[:city],facility[:state],facility[:zipcode]].join(" "), 
                phone: facility[:phone] || facility[:public_phone_number]
                                    })
        
        end
    end

end   

#Colorado address key
#[facility[:address_li],facility[:address__1],facility[:city],facility[:state],facility[:zip]].join(" ")

#New York address key
#[facility[:street_address_line_1],facility[:city],facility[:state],facility[:zip_code]].join(" ")

#Missouri address key
# [facility[:address1],facility[:city],facility[:state],facility[:zipcode]].join(" ")