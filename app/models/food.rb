class Food
  attr_reader :name, :brand,
              :calories, :fat,
              :serving_size

  def initialize(food)
    @name = food[:fields][:item_name]
    @brand = food[:fields][:brand_name]
    @calories = food[:fields][:nf_calories].round if food[:fields][:nf_calories]
    @fat = food[:fields][:nf_total_fat].round if food[:fields][:nf_total_fat]
    @serving_size = food[:fields][:nf_serving_size_qty]
  end


  def self.find_by_title(food)
    FoodService.get_food(food).map do |food|
      new(food)
    end
  end


end
