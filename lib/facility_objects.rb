require './lib/facility'
class FacilityObjects
    def initialize

    end

    def create_facilities(facilities)
        facilities.map do |facility|
            new_facility = Facility.new({
                name: facility[:dmv_office] || facility[:office_name], 
                address: [facility[:address_li],facility[:address__1],facility[:city],facility[:state],facility[:zip]].join(" ") || [facility[:street_address_line_1],facility[:city],facility[:state],facility[:zip_code]].join(" "), 
                phone: facility[:phone] || facility[:public_phone_number] 
                                    })
            #binding.pry
        end
    end
end