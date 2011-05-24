#.rb file to hold the def for the stats variable to to put in the player init
#need to set up a player role classes like warrior (strength), paladin(defense), rouge(speed), fencer maybe (accuracy), swordsman (all)

def class_stat_bonus (pclass, stat)
	case pclass
		when w
			case stat
				when "str"
				8
				else
				0
			end
		when p
			case stat
				when "def"
				8
				else
				0
			end
		when r
			case stat
				when "spd"
				8
				else
				0
			end
		when f
			case stat
					when "acc"
					8
					else
					0
				end
			end
		when s
			case stat
				when "def"
				2
				when "spd"
				2
				when "acc"
				2
				when "str"
				2
			end
	end
end
		
def stat_set	
until $stat_points.nil? and ready == true
	ready == false
	prints "strength: "
	strength_points = gets.to_i
	if strength_points > $stat_points or not strength_points.integer
		puts "Please enter a number equal to or lower than the points left."
	else
		$stat_points -= strength_points
	end
	prints "defense: "
	defense_points = gets.to_i
	if defense_points > $stat_points or not defense_points.integer
		puts "Please enter a number equal to or lower than the points left."
	else
		$stat_points -= defense_points
	end
	prints "speed: "
	speed_points = gets.to_i
	if speed_points > $stat_points or not speed_points.integer
		puts "Please enter a number equal to or lower than the points left."
	else
		$stat_points -= speed_points
	end
	prints "accuracy: "
	accuracy_points = gets.to_i
	if accuracy_points > $stat_points or not accuracy_points.integer
		puts "Please enter a number equal to or lower than the points left."
	else
		$stat_points -= accuracy_points
	end
	
	puts "Are you sure this is the stat assignment you want?"
	print "y/n > "
	uready = gets.chomp
	case uready
		when "y" or "yes"
		def_user_bonus = def_points
		spd_user_bonus = spd_points
		acc_user_bonus = acc_points
		str_user_bonus = str_points
		ready = true
		else
		ready = false
	end
		
end
end
	
stat_set
defense = 2 + class_stat_bonus(player class, "def") + def_user_bonus
speed = 2 + class_stat_bonus(player class, "spd") + spd_user_bonus
accuracy = 2 + class_stat_bonus(player class, "acc") + acc_user_bonus
strength = 2 + class_stat_bonus(player class, "str") + str_user_bonus
