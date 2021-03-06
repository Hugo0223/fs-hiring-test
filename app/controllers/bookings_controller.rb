class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @global_revenues = revenues_bookings(@bookings)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    authorize @booking
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.fetch(:booking, {})
    end
end
