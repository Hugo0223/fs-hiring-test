class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  # GET /rooms/1
  # GET /rooms/1.json
  def show
    authorize @room
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.fetch(:room, {})
    end
end
