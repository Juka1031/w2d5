class Item
    attr_reader :deadline
    attr_accessor :title, :description
    def self.valid_date?(date_string)
        arr = date_string.split("-")
        if arr.length != 3
            raise "invalid format"
        end
        if arr[0].length != 4 ||!(/\A[-+]?\d+\z/ === arr[0]) || arr[0].to_i > 9999 || arr[0].to_i < 1
            raise "invalid format"
        elsif arr[1].length != 2 || !(/\A[-+]?\d+\z/ === arr[1]) || arr[1].to_i > 12 || arr[1].to_i < 1
            raise "invalid format"
        elsif arr[2].length != 2 || !(/\A[-+]?\d+\z/ === arr[2]) || arr[2].to_i > 31 || arr[2].to_i < 1
            raise "invalid format"
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline) == true
            @deadline = deadline
        end
        @description = description

    end
    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline) == false
            raise "invalid format"
        else
            @deadline = new_deadline
        end
    end
    
end