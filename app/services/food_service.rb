class FoodService
  def find_food(food)
    find_by_title(food)
  end

  def self.get_food(food)
    new.find_food(food)[:hits]
  end

  private

  def find_by_title(food)
    search_food = food.gsub(/ /, '%20')
    conn        = Faraday.get("https://api.nutritionix.com/v1_1/search/#{search_food}?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat%2Cnf_carbs&appId=#{ENV["nutronix_id"]}&appKey=#{ENV["nutronix_key"]}")
    response    = JSON.parse(conn.body, symbolize_names: true)
  end
end
