class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_seeker_id = current_user.id
    @booking.user_guide_id = User.where(is_guide: true).sample.id
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def show
    if current_user.present?
      @booking = Booking.find(params[:id])
      @chatroom = Chatroom.new
    else
      redirect_to "/"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  def my_bookings
    if current_user.present? && current_user.is_guide == true
      @my_bookings = Booking.where(user_guide_id: current_user.id)
      @chatroom = Chatroom.new
    elsif current_user.present? && current_user.is_guide == false
      @my_bookings = Booking.where(user_seeker_id: current_user.id)
      @chatroom = Chatroom.new
    else
      redirect_to "/"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to my_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:topic, :provider, :price, :url, :notes)
  end
end
