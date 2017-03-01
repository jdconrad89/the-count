require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do

  context 'associations' do
    it { is_expected.to belong_to :ingredient }
    it { is_expected.to belong_to :recipe }
  end
end
