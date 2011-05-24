def user_class_set
	puts "choose your player class"
	puts "input the corresponding number to select class"
	until ready == true
	puts "1 = Warrior (strength) 2 = Paladin (defense) 3 = Rouge (speed) 4 = Fencer (accuracy) 5 = Swordsman (all)
	print "class: "
	class_choice = gets.chomp
	case class_choice
		when 1
			user_class = "warrior"
			ready == true
		when 2
			user_class = "paladin"
			ready == true
		when 3
			user_class = "rouge"
			ready == true
		when 4
			user_class = "fencer"
			ready == true
		when 5
			user_class = "swordsman"
			ready == true
		else
			puts "Try again"
	end
end
