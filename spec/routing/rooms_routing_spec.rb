require "rails_helper"

RSpec.describe RoomsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/motels/1/rooms/1").to route_to("rooms#show", :id => "1",:motel_id =>"1")
    end

  end
end
