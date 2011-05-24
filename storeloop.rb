require 'complexStore.rb'
# start the store
s = CStore.new("Bob", {"fries" => 10, "burgers" => 25, "hotdog" => 12})
s.greet
s_loop = 1
	while s_loop == 1
	print "store > "
	input = gets.chomp
		case input
			when "store inv"
			s.inv_list
			when "buy"
				puts "buy what"
				print "> "
					buy_choice = gets.chomp
						#if buy_choice doesn't match a key in store inventory
						if s.check_inv(buy_choice) == 0
							puts "Don't got none"
						else
							s.buy buy_choice
					end
			when "name"
				puts s.name
			when "leave"
			puts s.goodbye
			s_loop = 0
		end
	end
else
puts "Do what?"
end
end

