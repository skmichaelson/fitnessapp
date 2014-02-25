class CheckInsController < ApplicationController

  def new
  end

  def create
    last_check_in = current_user.check_ins.last || current_user
    @check_in = current_user.check_ins.new(current_wt: params[:current_wt])
    if @check_in.save
      flash[:notices] = ["Thanks for checking in!"]
      lbs_lost = last_check_in.current_wt - @check_in.current_wt

      if lbs_lost > 0
        pound_unit = lbs_lost == 1 ? "pound" : "pounds"
        feed_item = @check_in.feed_items.new(user_id: current_user.id)
        feed_item.body = "lost #{lbs_lost} #{pound_unit} since #{last_check_in.created_at}"
        feed_item.save
      end

      redirect_to root_url

    else
      flash[:errors] = @check_in.errors.full_messages
      render :new
    end
  end
end
