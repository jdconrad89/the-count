require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :brand }
    it { is_expected.to validate_presence_of :calories }
    it { is_expected.to validate_presence_of :fat }
    it { is_expected.to validate_presence_of :serving_size }
    it { is_expected.to validate_uniqueness_of :name }
  end

  context 'associations' do
    it { is_expected.to have_many :recipes }
    it { is_expected.to have_many :recipe_ingredients }
  end
end
