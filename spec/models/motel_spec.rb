require 'rails_helper'

RSpec.describe Motel, type: :model do
	describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:rooms) }
    it { is_expected.to have_many(:bookings) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :user }
  end
end
