$level = 1


if $level == 
case level_cap
	when 1
		cap = (5 * $level) ** 2)
		$level += 1
		end
	when 2
		if @xp >= ((5 * $level) ** 2) 
		level_up
		end
	when 3
		if @xp >= ((4 * $level) ** 2.1)
		level_up
		end
	when 4
		if @xp >= ((3 * $level) ** 2.2)
		level_up
		end
	else
		if @xp >= ((2 * $level) ** 2.3)
		level_up
		end
end
