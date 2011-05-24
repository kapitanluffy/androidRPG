require 'maps.rb'

class Portal
	def initialize(pnum, x, y)
		@pnum = pnum
		@x = x
		@y = y
	end
	
	def check_pnum
		Map.check_portal "@pnum"
	end
end
