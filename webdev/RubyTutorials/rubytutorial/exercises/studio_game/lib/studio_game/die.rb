require_relative "auditable"
module StudioGame
    class Die 
        attr_reader :number
        include Auditable
        
        def initialize
            roll
        end

        def roll 
            @number = rand(1..6)
            audit
            @number
        end
    end
end