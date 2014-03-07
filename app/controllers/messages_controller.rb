class MessagesController < ApplicationController

  def index
    @messages = current_user.received_messages.order('created_at DESC').page(params[:page])
    @friends = current_user.friends
    
    if !@messages.empty? && current_user.is_demo
      flash[:demo] = ["Click on a message to open it!"]
    end
  end

  def show
    if current_user.is_demo
      flash[:demo] = ["Thanks for completing the demo. Feel free to explore on your own!"]
    end
    @message = Message.find(params[:id])
    @message.update_attributes(is_read: true)
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

  def mark_unread
    @message = Message.find(params[:id])
    @message.update_attributes(is_read: false)
    redirect_to messages_url
  end
end
