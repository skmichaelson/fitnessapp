class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_logged_in, :current_goal

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_goal
    return nil unless current_user && current_user.goal && current_user.goal.persisted?
    @current_goal ||= current_user.goal
  end

  def require_logged_in
    # TODO set the last page to memory?
    flash[:errors] = "You must log in first!"
    redirect_to new_session_url unless current_user
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
end
