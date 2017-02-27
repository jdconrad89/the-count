require 'rails_helper'

describe FoodService do
  context '.get_food' do
    it 'returns all users from the database' do
      VCR.use_cassette("food_service.get_food") do
        raw_foods = FoodService.get_food("strawberry")

        expect(raw_foods).to be_an(Array)

        raw_food = raw_foods.first[:fields]

        expect(raw_food).to be_a(Hash)
        expect(raw_food).to have_key(:item_name)
        expect(raw_food).to have_key(:brand_name)
        expect(raw_food).to have_key(:nf_calories)
        expect(raw_food).to have_key(:nf_total_fat)
        expect(raw_food[:item_name]).to be_a(String)
        expect(raw_food[:brand_name]).to be_a(String)
        expect(raw_food[:nf_calories]).to be_a(Float)
        expect(raw_food[:nf_total_fat]).to be_a(Float)
      end
    end
  end
end
