require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context 'associations' do
    it { is_expected.to have_many :recipes }
  end

  context '#registered?' do

    it 'returns true for any user' do
      user = User.create(name: "Waylon Jennings", email: 'waylon@music.com', password: 'password')

      expect(user.role).to eq(0)
    end
  end

end
