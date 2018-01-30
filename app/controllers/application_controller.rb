class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :authenticate_user!
  
	def revenues_bookings(bookings)
		total_centavos = 0
		bookings.each do |booking|
			total_centavos += booking.amount_centavos * (100-booking.fee_percentage)
		end
		(total_centavos/100).round(2)
	end

	def revenues_resources(resources)
		revenues = []
		resources.each do |resource|
			revenues[resource.id] = revenues_bookings(resource.bookings)
		end
		return revenues
	end

	# def revenues_resource(rooms)
	# 	revenues = []
	# 	rooms.each do |room|
	# 		revenues[room.id] = revenues_bookings(room.bookings)
	# 	end
	# 	return revenues
	# end

	# def revenues_motels(motels)
	# 	revenues = []
	# 	motels.each do |motel|
	# 		revenues[motel.id] = revenues_bookings(motel.bookings)
	# 	end
	# 	return revenues
	# end

  def after_sign_in_path_for(resource)
  	motels_path
	end
end
