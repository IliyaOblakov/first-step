class ChatroomsController < ApplicationController
  def show
    if current_user.present?
      @booking = Booking.find(params[:booking_id])
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
      @user = current_user
    else
      redirect_to "/"
    end
  end

  def create
    @chatroom = Chatroom.new
    @booking = Booking.find(params[:booking_id])
    @chatroom.booking = @booking
    @chatroom.save
    redirect_to booking_chatroom_path(@booking, @chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
