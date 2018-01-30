require 'rails_helper'

RSpec.describe Booking, type: :model do
	describe 'Associations' do
    it { is_expected.to belong_to(:motel) }
    it { is_expected.to belong_to(:room) }
  end

  describe 'Validations' do

    it { should validate_uniqueness_of(:booking_code).ignoring_case_sensitivity }
  end

  context 'valid params' do
    before(:all) do
    	@motel = Motel.first
    	@room = @motel.rooms.first
			@booking = Booking.new(motel_id: @motel.id, room_id: @room.id, booking_code: "BOOKINGCODE")
    end
    it 'is valid with valid attributes' do
      expect(@booking).to be_valid
    end
  end

  context 'invalid params' do
    before(:all) do
    	@motel = Motel.first
    	@room = @motel.rooms.first
			@booking = Booking.new(motel_id: @motel.id, room_id: @room.id, booking_code: Booking.first.booking_code)
    end
    it 'is invalid with a taken booking code' do
      expect(@booking).not_to be_valid
    end
  end
end
