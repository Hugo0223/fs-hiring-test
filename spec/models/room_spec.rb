require 'rails_helper'

RSpec.describe Room, type: :model do
	describe 'Associations' do
    it { is_expected.to belong_to(:motel) }
    it { is_expected.to have_many(:bookings) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :motel }
    it { is_expected.to validate_presence_of :name }
  end
end
