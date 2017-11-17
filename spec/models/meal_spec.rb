require 'rails_helper'

RSpec.describe Meal, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :date}
  end

  context 'associations' do
    it { is_expected.to belong_to :user}
    it { is_expected.to have_many :ingredients}
    it { is_expected.to have_many :meal_ingredients}
  end
end
