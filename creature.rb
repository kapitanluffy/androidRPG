class Creature
	def initialize(name, health)
		@name = name
		@health = health
	end
	attr_accessor :name, :health

	def status_str
		"The enemy is a #{@name} with #{@health} health."
	end
	
	def is_alive?
		@health > 0
	end

	def is_dead?
		not is_alive?
	end

	
end

def spawn
	case rand(6)
	when 1
		$current_enemy = Creature.new("badger", 10)
	when 2
		$current_enemy = Creature.new("goat", 20)
	when 3
		$current_enemy = Creature.new("frog", 30)
	when 4
		$current_enemy = Creature.new("rabbit", 40)
	when 5
		$current_enemy = Creature.new("turtle", 50)
	else	
		puts "No enemy is around"	
	end
end
