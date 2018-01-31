class HomeController < ApplicationController
	
	# Dashboard 
	def index
    	@bookings = policy_scope(Booking).order(created_at: :desc)
        @global_revenues = revenues_bookings(@bookings)
        @bookings_per_month = @bookings.all.group_by { |m| m.created_at.beginning_of_month }
        @bookings_per_motel = @bookings.all.group_by { |m| m.motel }

        ## Table "Revenues per months"
        @monthly_datas = []
        @bookings_per_month.each do |month|
        	# Month[0] : name of the month
        	# Month[1] : array of bookings during that month
        	@monthly_datas << {
        		"name" => month[0].strftime("%b %Y"),
        		"bookings" => month[1].count,
        		"revenues" =>revenues_bookings(month[1])
        	}
        end
        ## Table "Revenues per motel"
        @motels_datas = []
        @bookings_per_motel.each do |motel|
    			@motels_datas << {
        		"name" => motel[0].name,
        		"bookings" => motel[1].count,
        		"revenues" =>revenues_bookings(motel[1])
        	}
        end
	end
end
