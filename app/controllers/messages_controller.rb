class MessagesController < ApplicationController

  def index
    @messages = current_user.received_messages.order('created_at DESC').page(params[:page])
    @friends = current_user.friends
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

  def create
    recipient_id = params[:message][:recipient_id]
    body = params[:message][:body]
    subject = params[:message][:subject]
    @message = current_user.sent_messages.new(recipient_id: recipient_id, subject: subject, body: body)

    if @message.save
      flash[:notices] = ["Message sent to #{@message.recipient.username}!"]
      redirect_to messages_url
    else
      flash.now[:errors] = @message.errors.full_messages
      render :index
    end
  end
end
