require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
	before(:each) do
		@motel = Motel.new(id: 1 , name: "TestMotel")
		@room = Room.new(name: "TestRoom", motel: @motel)
		@booking1 = Booking.new(motel: @motel, room: @room, amount_centavos: 9000, fee_percentage: 10) # 81
		@booking2 = Booking.new(motel: @motel, room: @room, amount_centavos: 10000, fee_percentage: 5) # 95
  end

	it 'revenues_booking' do
		expect(subject.revenues_booking(@booking1)).to eq 81
	end

	it 'revenues_bookings' do
		expect(subject.revenues_bookings([@booking1,@booking2])).to eq 176
	end
	
end
