require "rails_helper"  

RSpec.describe User, type: :model do
	describe 'Associations' do
    it { is_expected.to have_many(:motels) }
    it { is_expected.to have_many(:rooms) }
    it { is_expected.to have_many(:bookings) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
		it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  context 'valid params' do
    before(:all) do
			@user = User.new(email: "user@test.dev", password: "123456")
    end
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end
  end

  context 'invalid params' do
    before(:all) do
      @user2 = User.new(email: "user@one.dev", password: "azerty")
    end
    it 'is invalid with an existing email' do
      expect(@user2).not_to be_valid
    end
  end
end


