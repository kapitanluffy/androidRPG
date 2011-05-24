require 'portals.rb'

class Map
	def initialize ()
	
	end
	def change_map_locus(move)
		case move
			when right
				map_locus += 1
			when left
				map_locus -= 1
			when up
				map_locus += 10
			when down
				map_locus -= 10
			else
				#don't change the map
		end
		#load map_arr[map]
	end

	def get_portal_number
		Portal.check_pnum
	end

	def check_portal(portal_num)
		case portal_num
			when 1
				change_map(up)
			when 2
				chagne_map(right)
			when 3
				change_map(down)
			when 4
				change_map(left)
			else
				#add more stuff later do nothing for now
		end
	end
end

def portal_generate
#creates 4 directional portals on a map
portalOne = Portal.new(1, 250, 500) #creates a portal that goes up at the middle top
portalTwo = Portal.new(2, 500, 250) #creates a portal that goes right at the middle right
portalThree = Portal.new(3, 250, 0) #creates a portal that goes down at the middle bottom
portalFour = Portal.new(4, 0, 250)  #creates a portal that goes left at the middle left
end
