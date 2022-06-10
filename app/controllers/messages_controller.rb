class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @user = current_user
    # @user_guide = @message.user.bookings.user_guide
    if @message.save
      ChatroomChannel.broadcast_to(@chatroom, render_to_string(partial: "message", locals: { message: @message }))
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
