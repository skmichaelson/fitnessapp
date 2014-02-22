module MealEntriesHelper
  def calculate_by_quantity(food, quantity)
    nutrition_attributes = food.attributes.reject do |attr|
      %w(id name usda_id common_weight_1 common_weight_2 common_serving_1 common_serving_2 created_at updated_at).include?(attr)
    end

    adjusted_attr = {}

    nutrition_attributes.each do |attr, val|
      adjusted_attr[attr] = (val * quantity / 100.0)
    end

    adjusted_attr
  end
end
