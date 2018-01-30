class MotelsController < ApplicationController
  before_action :set_motel, only: [:show, :edit, :update, :destroy]

  # GET /motels
  # GET /motels.json
  def index
    @motels = current_user.motels
    @revenues_motels = revenues_resources(@motels)
  end

  # GET /motels/1
  # GET /motels/1.json
  def show
    # Show Motel => Motel infos + all rooms in motel with revenue
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motel
      @motel = Motel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motel_params
      params.fetch(:motel, {})
    end
end
