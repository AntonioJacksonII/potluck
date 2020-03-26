class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select { |dish| dish.category == category }
  end

  def menu
    {:appetizers => get_dish_names_by_category(get_all_from_category(:appetizer)), :entres => get_dish_names_by_category(get_all_from_category(:entre)), :desserts => get_dish_names_by_category(get_all_from_category(:dessert))}
  end

  def get_dish_names_by_category(category_dishes)
    category_dishes.map { |dish| dish.name}.sort
  end

  def ratio(category)
    ((get_all_from_category(category).length / @dishes.length.to_f) * 100).round(1)
  end

end
