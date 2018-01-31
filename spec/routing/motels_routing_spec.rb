require "rails_helper"

RSpec.describe MotelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/motels").to route_to("motels#index")
    end
 
    it "routes to #show" do
      expect(:get => "/motels/1").to route_to("motels#show", :id => "1")
    end

  end
end
