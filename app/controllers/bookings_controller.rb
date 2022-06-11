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
    @chatroom = Chatroom.new
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  def my_bookings
    if current_user.present? && current_user.is_guide == true
      @my_bookings = Booking.where(user_guide_id: current_user.id)
    elsif current_user.present? && current_user.is_guide == false
      @my_bookings = Booking.where(user_seeker_id: current_user.id)
    else
      redirect_to "/"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:topic)
  end
end
