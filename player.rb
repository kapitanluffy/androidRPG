require 'creature.rb'
require 'complexStore.rb'

class Player
	def initialize (name, level, health, player_class, stats, xp, inventory, gold, x, y)
		@name = name
		@level = level
		@health = health
		@player_class = player_class
		@stats = stats
		@xp = xp
		@inv = inventory
		@gold = gold
		@x = x
		@y = y
	end

	def define_char
		"#{@name} is a level #{@level} #{@player_class}" 
	end
	
	def define_stats
		"#{@stats["strength"]} strength, #{@stats["speed"]} speed, #{@stats["accuracy"]} accuracy, #{@stats["defense"]} defense"
	end
	
	def name
		@name
	end
	
	def attack
		#damage.Creature
	end
	
	def level_stats
		levels_arr = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]	
		@health += 10
		# test to see if they get a extra stat bonus at a 5 level increment
		if levels_arr.index{|x|x == @level} && @player_class == "warrior"
			@stats["strength"] += 5
			@stats["speed"] += 1
			@stats["accuracy"] += 1
			@stats["defense"] += 1
		elsif levels_arr.index{|x|x == @level} && @player_class == "rouge"
			@stats["strength"] += 1
			@stats["speed"] += 5
			@stats["accuracy"] += 1
			@stats["defense"] += 1
		elsif levels_arr.index{|x|x == @level} && @player_class == "fencer"
			@stats["strength"] += 1
			@stats["speed"] += 1
			@stats["accuracy"] += 5
			@stats["defense"] += 1
		elsif levels_arr.index{|x|x == @level} && @player_class == "paladin"
			@stats["strength"] += 1
			@stats["speed"] += 1
			@stats["accuracy"] += 1
			@stats["defense"] += 5
		elsif levels_arr.index{|x|x == @level} && @player_class == "swordsman"
			@stats["strength"] += 3
			@stats["speed"] += 3
			@stats["accuracy"] += 3
			@stats["defense"] += 3
		else
			# give player an increase in stats and a bonus on the class stat
			if @player_class == "warrior"
				@stats["strength"] += 2
				@stats["speed"] += 1
				@stats["accuracy"] += 1
				@stats["defense"] += 1
			elsif @player_class == "rouge"
				@stats["strength"] += 1
				@stats["speed"] += 2
				@stats["accuracy"] += 1
				@stats["defense"] += 1
			elsif @player_class == "fencer"
				@stats["strength"] += 1
				@stats["speed"] += 1
				@stats["accuracy"] += 2
				@stats["defense"] += 1
			elsif @player_class == "paladin"
				@stats["strength"] += 1
				@stats["speed"] += 1
				@stats["accuracy"] += 1
				@stats["defense"] += 2
			elsif @player_class == "swordsman"
				@stats["strength"] += 1
				@stats["speed"] += 1
				@stats["accuracy"] += 1
				@stats["defense"] += 1
			end
		end
		puts "health increased by 10. Health: #{@health}"
		puts define_stats
	end
	
	def level_up
		@level += 1
		puts "Congradulations, you leveled up! Your level is now #{@level}."
		level_stats
	end

	def leveling(level_cap)
		case level_cap
			when 1
				if @xp >= ((5 * @level) ** 2)
				level_up
				end
			when 2
				if @xp >= ((5 * @level) ** 2) 
				level_up
				end
			when 3
				if @xp >= ((4.8 * @level) ** 2.1)
				level_up
				end
			when 4
				if @xp >= ((3.6 * @level) ** 2.25)
				level_up
				end
			else
				if @xp >= ((2.4 * @level) ** 2.4)
				level_up
				end
		end
	end

	def recieve_xp
		if @level <= 7
			@xp += rand(@level * 2.2) + rand(15)
			puts "You have #{@xp}"
			leveling(1)
		elsif @level <= 19
			@xp += rand((@level * 2) * 2) + rand(25)
			puts "You have #{@xp}"
			leveling(2) 
		elsif @level <= 35
			@xp += rand((@level * 3) * 3) + rand(50)
			puts "You have #{@xp} xp"
			leveling(3)
		elsif @level <= 50
			@xp += rand((@level * 4) * 3) + rand(75)
			puts "You have #{@xp}"
			leveling(4)
		else
			@xp += rand((@level * 4) * 4) + rand(100)
			puts "You have #{@xp}"
			leveling(5)
		end
	end
	
	def get_xp
		until @level == 10
			recieve_xp
		end
	end
	
	def add_item(item, amount)
		#see if the item is in the array for inventory
		if @inv[item].include?
			@inv[item] += amount
		else
			#if no then add to the @inv the spot in the next slot of the array
			# add
		end
	end
	
	def store_check(store)
		@store = store
	end
	
	def buy_item(item, amount, price)
		sale_total = amount * price
		if sale_total > @gold
			puts "You can't afford to buy that"
		else
			@gold -= sale_total
			puts "You bought #{amount} #{item}(s) for #{sale_total}"
			@store.decrease_inv(item, amount)
		end
	end
	
	def list_inv
		puts "You have:"
		@inv.each do |k,v|
				print " #{v} #{k}"
		end
		print " and #{@gold} gold."
		puts ""
	end
end
