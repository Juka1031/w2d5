require "./item"


class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end
    
    def add_item(title, deadline, *description)
        if Item.valid_date?(deadline) == true
            if description == []
                @items << Item.new(title, deadline, "" ) #empty description = empty string?
            else#description is not nil
                @items << Item.new(title, deadline, description.join )
            end
            return true
        else
            return false
        end
    end
    def toggle_item(index)
        item = self[index]
        
        if !item.nil?
            item.toggle
        end
    end
    
    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || index > @items.length-1 #or Item.size?
            return false
        else
            return true
        end
    end
    
    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        if valid_index?(index)
            return @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "          #{@label}"
        puts "--------------------------------"
        puts "Index  | Item         | Deadline"
        puts "--------------------------------"
        @items.each_with_index do |item,idx|
            puts "#{idx}      #{item.title}         #{item.deadline}"
        end
            "--------------------------------"

    end

    def print_full_item(index)
        if valid_index?(index)
            puts "--------------------------------------------------"
            puts "#{@items[index].title}   #{@items[index].deadline}   #{@items[index].description}  "
            "-------------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, *amount)
        if valid_index?(index)
            if amount == [] && index != 0#no arguements passed swap once as long as its not at the top
                self.swap(index, (index-1))
            else #if an arguement IS passed swap amount times
                swapped_idx = index - 1
                current_idx = index
                amount[0].times do 
                    if swapped_idx  < 0
                        break
                    end
                        self.swap(current_idx, swapped_idx)
                        swapped_idx -= 1
                        current_idx -= 1
                end
            end
        else
            return false
        end
    end
    def down(index, *amount)
        if valid_index?(index)
            if amount == [] && index != @items.length-1 #no arguements passed swap once as long as its not at the bottom
                self.swap(index, (index+1))
            else #if an arguement IS passed swap amount times
                swapped_idx = index + 1
                current_idx = index
                amount[0].times do 
                    if swapped_idx  > @items.length-1
                        break
                    end
                        self.swap(current_idx, swapped_idx)
                        swapped_idx += 1
                        current_idx += 1
                end
            end
        else
            return false
        end
    end

    def sort_by_date!
        # current = nil
        # temp = nil
        # idx1 = nil
        # @items.each_with_index do |item,idx|
        #     temp = item.deadline.split("-").join.to_i
        #     if current == nil #first item should become current
        #         current = temp
        #         idx1 = idx
        #     end
        #     if temp < current
        #         current = temp
        #         idx1 = idx
        #     end
        # end
        # @items[idx1]
        temp = nil
        temp_next = nil
        sorted = true
        while sorted
            sorted = false
            @items.each_with_index do |item,idx|
                if @items[idx+1] != nil #so we dont go beyond the bounds
                    temp = item.deadline.split("-").join.to_i #this is now an integer
                    temp_next = @items[idx+1].deadline.split("-").join.to_i
                    if temp_next < temp #if the date is earlier, swap
                        #swap
                        @items[idx], @items[idx+1] = @items[idx+1], @items[idx]
                        sorted = true
                    end
                end
            end
        end
    end
end

