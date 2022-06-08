class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_seeker_id = current_user.id
    @booking.user_guide_id = User.where(is_guide: true).sample.id
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:topic)
  end
end
