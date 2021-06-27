require "./list"


class TodoBoard
    def initialize(label)
        @board = List.new(label)
    end

    def get_command
        puts "Enter inputs"
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when "mktodo"
            @board.add_item(*args)
        when 'toggle'
            @lists.toggle_item(args[0].to_i)
        when "up"
            @board.up(*args.map(&:to_i))
        when "down"
            @board.down(*args.map(&:to_i))
        when "swap"
            @board.swap(*args.map(&:to_i))
        when "sort"
            @board.sort_by_date!
        when "priority"
            @board.print_priority
        when "print"
            if args == []
                @board.print
            else
                @board.print_full_item(*args[0].to_i)
            end
        when "quit"
            return false
        else
            puts "invalid format"
        end
        true
    end
    def run
        while true
            return if !get_command
        end
    end
end