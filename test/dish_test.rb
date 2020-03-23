require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test
  def test_dish_exists
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_instance_of Dish, dish
  end

  def test_dish_name
    dish = Dish.new("Couscous Salad", :appetizer)

    assert_equal dish.name, "Couscous Salad"
    assert_equal dish.category, :appetizer
  end

end
