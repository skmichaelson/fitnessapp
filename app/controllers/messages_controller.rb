class MessagesController < ApplicationController

  def index
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notices] = ["Message deleted"]
    redirect_to messages_url
  end
end
