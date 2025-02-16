require './lib/facility'
class FacilityObjects
    def initialize

    end

    def create_facilities(facilities)
        facilities.map do |facility|
            new_facility = Facility.new({name: facility[:dmv_office] || facility[:office_name], 
                                        address: [facility[:address_li],facility[:address__1],facility[:city],facility[:state],facility[:zip]].join(" "), 
                                        phone: facility[:phone] })
            #binding.pry
        end
    end
end