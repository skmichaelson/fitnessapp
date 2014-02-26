class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_logged_in, :current_goal, :current_user_diary, :calculate_by_quantity

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_goal
    return nil unless current_user && current_user.goal && current_user.goal.persisted?
    @current_goal ||= current_user.goal
  end

  def current_user_diary
    return nil unless current_user && current_user.diary && current_user.goal.persisted?
    @current_user_diary ||= current_user.diary.first
  end

  def require_logged_in
    unless current_user
    # TODO set the last page to memory?
      flash[:errors] = ["You must be signed in to view this page!"]
      redirect_to root_url
    end
  end

  def calculate_goal(ratio, base)
    (ratio * base / 100).round
  end

  def calculate_by_serving(food, serving_size, num_servings)
    nutrition_attributes = food.attributes.reject do |attr|
      %w(id name usda_id common_weight_1 common_weight_2 common_serving_1 common_serving_2 created_at updated_at).include?(attr)
    end

    adjusted_attr = {}

    nutrition_attributes.each do |attr, val|
      adjusted_attr[attr] = (val * serving_size * num_servings / 100)
    end

    adjusted_attr
  end

  def calculate_by_quantity(food, quantity)
    nutrition_attributes = food.attributes.reject do |attr|
      %w(id name usda_id common_weight_1 common_weight_2 common_serving_1 common_serving_2 created_at updated_at).include?(attr)
    end

    adjusted_attr = {}

    nutrition_attributes.each do |attr, val|
      adjusted_attr[attr] = (val * quantity / 100)
    end

    adjusted_attr
  end

  def serving_size
    params[:servings] ? params[:servings][:size].to_f : 100
  end

  def num_servings
    params[:servings] ? params[:servings][:number].to_f : 1
  end

  def calculate_quantity(servings, size)
    servings.to_f * size.to_f
  end
end
