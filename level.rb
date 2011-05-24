class Player
	def initialize (xp, level)
	@xp = xp
	@level = level
	end

	def level_up
		@level += 1
		puts "Congradulations, you leveled up! Your level is now #{@level}."
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
				if @xp >= ((3.6 * @level) ** 2.2)
				level_up
				end
			else
				if @xp >= ((2.4 * @level) ** 2.3)
				level_up
				end
		end
	end

	def recieve_xp
		if @level <= 7
			@xp += (rand(15) + rand(@level * 2.2))
			puts "You have #{@xp}"
			leveling(1)
		elsif @level >= 8 && @level <= 19
			@xp += rand(25) + rand((@level * 2) * 2)
			puts "You have #{@xp}"
			leveling(2) 
		elsif @level >= 20 && @level <= 35
			@xp += (rand(50) + rand((@level * 3) * 3))
			puts "You have #{@xp}"
			leveling(3)
		elsif @level >= 36 && @level <= 50
			@xp += (rand(100) + rand((@level * 4) * 3))
			puts "You have #{@xp}"
			leveling(4)
		end

	end

	def xp_up
		until @level == 30
			recieve_xp
		end
	end
end

p = Player.new(0, 1)

p.xp_up
