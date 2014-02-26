class WeighInsController < ApplicationController

  def create
    last_weight = current_user.current_wt
    @weigh_in = current_user.weigh_ins.new(current_wt: params[:current_wt], previous_wt: last_weight)

    if @weigh_in.save
      flash[:notices] = ["Thanks for checking in!"]

      @weigh_in.report_items.create(user_id: current_user)
      lbs_lost = last_weight - @weigh_in.current_wt
      current_user.update_attributes(current_wt: params[:current_wt])

      if lbs_lost > 0
        pound_unit = lbs_lost == 1 ? "pound" : "pounds"
        feed_item = @weigh_in.feed_items.new(user_id: current_user.id)
        feed_item.body = "lost #{lbs_lost} #{pound_unit} since the last weigh in!"
        feed_item.save
      end

      redirect_to root_url

    else
      flash[:errors] = @weigh_in.errors.full_messages
      render :new
    end

  end
end
