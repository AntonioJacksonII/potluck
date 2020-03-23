require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotluckTest < Minitest::Test

  def setup
    @potluck = Potluck.new("7-13-18")
  end


  def test_potluck_exists

    assert_instance_of Potluck, @potluck
  end

  def test_date_is_correct

    assert_equal "7-13-18", @potluck.date
  end

  def test_dishes_are_empty

    assert_equal [], @potluck.dishes
  end

  def test_add_dish
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    @potluck.add_dish(couscous_salad)
    @potluck.add_dish(cocktail_meatballs)

    assert_equal [couscous_salad, cocktail_meatballs], @potluck.dishes
    assert_equal 2, @potluck.dishes.length
  end

  def test_get_all_from_category
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)

    @potluck.add_dish(couscous_salad)
    @potluck.add_dish(summer_pizza)
    @potluck.add_dish(roast_pork)
    @potluck.add_dish(cocktail_meatballs)
    @potluck.add_dish(candy_salad)

    assert_equal [couscous_salad, summer_pizza], @potluck.get_all_from_category(:appetizer)
    assert_equal couscous_salad, @potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", @potluck.get_all_from_category(:appetizer).first.name
  end

end
