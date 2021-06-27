require "passenger"

class Flight
    attr_reader :passengers
    def initialize(flight_num_str, capacity)
        @flight_number = flight_num_str
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        return false if @passengers.length < @capacity
    end

    def board_passenger(passenger)
        if self.full? == false && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passenger_names = []
        @passengers.each do |passenger|
            passenger_names << passenger.name
        end
        passenger_names
    end

    def [](index_num)
        @passengers[index_num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end