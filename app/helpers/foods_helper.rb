module FoodsHelper
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

  def serving_size
    params[:servings] ? params[:servings][:size].to_f : 100
  end

  def num_servings
    params[:servings] ? params[:servings][:number].to_f : 1
  end
end
