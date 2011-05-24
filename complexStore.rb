require 'player.rb'
class CStore
	def initialize (store_owner, inventory, price)
	@store_owner = store_owner
	@inventory = inventory
	@price = price
	end

	def greet
		puts "Welcome to #{name}"
		inv_list
		puts ""
	end

	def name
		sname = ""
		sname += "#{@store_owner}'s "
	  sname += @inventory.keys.join(' and ')
		sname += " shop"
	end

	def goodbye
		"Thanks for stopping by #{name}"
	end

	def inv_list
		if @inventory.nil?
			puts "We are out of stock at the moment, sorry for the trouble."
		else
			print "We have:"
			@inventory.each do |k,v|
				print " #{v} #{k}"
			end
			puts ""
		end

	end
	
	def check_inv (choice)
		if choice == @inventory[choice]
		1
		else
		0
		end
	end
	
	def decrease_inv (choice, amount)
		@inventory[choice] -= amount
	end

	def buy (choice, player)
		if @inventory.nil?
			puts "We are out at the moment"
		else
			print "How many: "
			amount = gets.to_i
			if amount > @inventory[choice]
				puts "We don't have that many in stock"
			else
				player.buy_item(choice, amount, @price[choice])
			end
		end
	end
end	


