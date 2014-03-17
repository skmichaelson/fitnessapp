module FoodsHelper
  def serving_size
    params[:servings] ? params[:servings][:size].to_f : 100
  end

  def num_servings
    params[:servings] ? params[:servings][:number].to_f : 1
  end

  def multiplier
    100 / params[:serving][:size].to_f * params[:serving][:unit].to_f
  end

  def invalid_search?(food_name)
    food_name.strip.empty? || food_name.length < 2
  end
end
