require "rails_helper"

RSpec.describe BookingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bookings").to route_to("bookings#index")
    end

    it "routes to #show" do
      expect(:get => "/bookings/1").to route_to("bookings#show", :id => "1")
    end
  end
end
