
class CStore
	def initialize (store_owner, inventory)
	@store_owner = store_owner
	@inventory = inventory
	end

	def greet
		puts "Welcome to #{name}"
		inv_list
	end

	def name
		"#{@store_owner}'s burger and fries joint"
	end

	def goodbye
		"Thanks for stopping by #{name}"
	end

	def inv_list
		if @inventory["fries"].nil? && @inventory["burgers"].nil?
			puts "We are out of stock at the moment, sorry for the trouble."
		else
			puts "We have #{@inventory["fries"]} fries and #{@inventory["burgers"]} burgers"
		end

	end

	def buy (choice)
		if choice == "fries" && @inventory["fries"] > 0
			@inventory["fries"] -= 1
			puts "You bought one order of fries, we have #{@inventory["fries"]} left"
		elsif choice == "burgers" && @inventory["burgers"] > 0
			@inventory["burgers"] -= 1
			puts "You bought one burger, we have #{@inventory["burgers"]} left"			
		else 
			puts "Sorry we are out of those"
		end
	end
end	

puts "What do you want to do?"
while 1 do
	print "> "
	choice = gets.chomp
	case choice 
		when "enter store"
		# start the store
		s = CStore.new("Bob", {"fries" => 10, "burgers" => 25})
		s.greet
		s_loop = 1
			while not s_loop.nil
			print "store > "
			input = gets.chomp
				case input
					when "store inv"
					s.inv_list
					when "buy"
						puts "buy what"
						print "> "
							buy_choice = gets.chomp
							case buy_choice
								when "fries"
									s.buy "fries"
								when "burgers"
									s.buy "burgers"
								else
									puts "What?"
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

