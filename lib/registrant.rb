class Registrant
    attr_reader :name, :age, :permit, :license_data
    def initialize(name,age, permit=false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {:written => false, :license => false, :renewed => false}
        
    end
    def permit?
        if @permit != false
            @permit = true
        else
            @permit = false
        end
    end


    def earn_permit
        @permit = true
    end
end