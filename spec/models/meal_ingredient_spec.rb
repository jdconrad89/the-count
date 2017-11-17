require 'rails_helper'

RSpec.describe MealIngredient, type: :model do

  context 'associations' do
    it { is_expected.to belong_to :ingredient }
    it { is_expected.to belong_to :meal }
  end
end
