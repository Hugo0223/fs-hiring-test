class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :authenticate_user!
  

  def revenues_booking(booking)
		(booking.amount_centavos * ((100-booking.fee_percentage).to_f/100)/100).round(2)
	end

	# Returns the total of all bookings
	def revenues_bookings(bookings)
		total_centavos = 0
		bookings.each do |booking|
				total_centavos +=   booking.amount_centavos * ((100-booking.fee_percentage).to_f/100)
		end	
		(total_centavos/100).round(2)

	end

	# Returns the total per motel or per room 
	def revenues_resources(resources)
		revenues = []
		resources.each do |resource|
			revenues[resource.id] = revenues_bookings(resource.bookings)
		end
		return revenues
	end

  def after_sign_in_path_for(resource)
  	bookings_path
	end
end
