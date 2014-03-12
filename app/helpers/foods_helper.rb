module FoodsHelper
  def serving_size
    params[:servings] ? params[:servings][:size].to_f : 100
  end

  def num_servings
    params[:servings] ? params[:servings][:number].to_f : 1
  end
end
