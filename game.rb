require 'player.rb'
require 'creature.rb'
require 'maps.rb'
require 'complexStore.rb'

def you_ready
	ready = false
	puts "Are you sure about your selection"
	i = 1
	while i == 1 do 
		print "y/n: "
		ask = gets.chomp
		if ask == "y"
			i = 0
			1
		elsif ask == "n"
			i = 0
			0
		else
			puts "please enter either y or n"
		end 
	end
end

def player_class_set
	picked_class = false
	ready = false
	puts "choose your player class"
	puts "input the corresponding number to select class"
		puts "1 = Warrior (strength) 2 = Paladin (defense) 3 = Rouge (speed) 4 = Fencer (accuracy) 5 = Swordsman (all)"
		until picked_class == true
			print "class: "
			class_choice = gets.to_i
			case class_choice
				when 1
					$player_class = "warrior"
					picked_class = true
				when 2
					$player_class = "paladin"
					picked_class = true
				when 3
					$player_class = "rouge"
					picked_class = true
				when 4
					$player_class = "fencer"
					picked_class = true
				when 5
					$player_class = "swordsman"
				else
					puts "Try again"
			end
		end
	puts "#{$name} the #{$player_class}"
end

def class_stat_bonus(pclass, stat)
	case pclass
		when "warrior"
			case stat
				when "def"
				$class_bonus_def = 1
				when "spd"
				$class_bonus_spd = 1
				when "acc"
				$class_bonus_acc = 1
				when "str"
				$class_bonus_str = 5
			end
		when "paladin"
			case stat
				when "def"
				$class_bonus_def = 5
				when "spd"
				$class_bonus_spd = 1
				when "acc"
				$class_bonus_acc = 1
				when "str"
				$class_bonus_str = 1
			end
		when "rouge"
			case stat
				when "def"
				$class_bonus_def = 1
				when "spd"
				$class_bonus_spd = 5
				when "acc"
				$class_bonus_acc = 1
				when "str"
				$class_bonus_str = 1
			end
		when "fencer"
			case stat
				when "def"
				$class_bonus_def = 1
				when "spd"
				$class_bonus_spd = 1
				when "acc"
				$class_bonus_acc = 5
				when "str"
				$class_bonus_str = 1
			end
		when "swordsman"
			case stat
				when "def"
				$class_bonus_def = 2
				when "spd"
				$class_bonus_spd = 2
				when "acc"
				$class_bonus_acc = 2
				when "str"
				$class_bonus_str = 2
			end
	end
end
		
def stat_set	
	ready = false
	$stat_points = 10
	until $stat_points == 0
		puts "#{$stat_points} points left"
		print "strength: "
		strength_points = gets.to_i
		if strength_points > $stat_points or not strength_points.integer?
			puts "Please enter a number equal to or lower than the points left."
		else
			$stat_points -= strength_points
			puts "#{$stat_points} points left"
		end
		print "defense: "
		defense_points = gets.to_i
		if defense_points > $stat_points or not defense_points.integer?
			puts "Please enter a number equal to or lower than the points left."
		else
			$stat_points -= defense_points
			puts "#{$stat_points} points left"
		end
		print "speed: "
		speed_points = gets.to_i
		if speed_points > $stat_points or not speed_points.integer?
			puts "Please enter a number equal to or lower than the points left."
		else
			$stat_points -= speed_points
			puts "#{$stat_points} points left"
		end
		print "accuracy: "
		accuracy_points = gets.to_i
		if accuracy_points > $stat_points or not accuracy_points.integer?
			puts "Please enter a number equal to or lower than the points left."
		else
			$stat_points -= accuracy_points
			puts "#{$stat_points} points left"
		end
		#puts "Are you sure this is the stat assignment you want?"
		#print "y/n > "
		#uready = gets.chomp
		#case uready
		#	when "y"
			$def_user_bonus = defense_points
			$spd_user_bonus = speed_points
			$acc_user_bonus = accuracy_points
			$str_user_bonus = strength_points
		#	ready = true
		#	else
		# ready = false
		# end
		
	end
end

def name_get
	print "What is your name: "
	$set_name = gets.chomp
end
def name_set
		name_get
	if you_ready == 1 then
		$name = $set_name
	else
		name_get
	end
end

name_set

player_class_set
stat_set
class_stat_bonus($player_class, "def")
class_stat_bonus($player_class, "spd")
class_stat_bonus($player_class, "acc")
class_stat_bonus($player_class, "str")

$defense = ($class_bonus_def + $def_user_bonus)
$speed = $class_bonus_spd + $spd_user_bonus
$accuracy = $class_bonus_acc + $acc_user_bonus
$strength = $class_bonus_str + $str_user_bonus

p = Player.new($name, 1, 100, $player_class, {"strength" => $strength, "speed" => $speed, "accuracy" => $accuracy, "defense" => $defense}, 0, {"potion" => 2, "fries" => 1, "hotdogs" => 0, "burgers" => 0}, 50, 0, 0)

puts p.define_char
puts p.define_stats

def s_choices(player, store)
	print "store > "
	input = gets.chomp
		case input
			when "store inv"
			store.inv_list
			when "buy"
				puts "buy what"
				print "> "
				buy_choice = gets.chomp
				#if buy_choice doesn't match a key in store inventory
				if store.check_inv(buy_choice).nil?
					puts "Don't got none"
				else
					player.store_check(store)
					store.buy(buy_choice, player)
				end
			when "name"
				puts store.name
			when "leave"
			puts store.goodbye
			$s_loop = 0
			else
				puts "I'm sorry, what?"
		end
end

def choices (player)
	print "> "
	input = gets.chomp
	case input
		when "s"
			if $current_enemy.nil? or $current_enemy.is_dead?
			spawn
			else
			puts "A enemy is already there"
			end
		when "c"
			if $current_enemy.nil?
				puts "There is no enemy"	
			else
				puts $current_enemy.status_str
			end	
		when "level"
			player.get_xp
		when "enter store"
			$s_loop = 1
			s = CStore.new("Bob", {"fries" => 10, "burgers" => 25, "hotdog" => 12}, {"fries" => 3, "burgers" => 7, "hotdogs" => 4})
			s.greet
			while $s_loop == 1 do
				s_choices(player, s)
			end
		when "inv"
			player.list_inv
		else
			puts "Im sorry what do you want to do?"
	end
end

while 1 do
	choices(p)
end
