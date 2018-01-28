class User < ApplicationRecord
  has_secure_password validations: false, if: :social_login?

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_many :recipes

  def find_or_create_by_omniauth(user_data)
    user = User.find_or_create_by(uid: user_data[:uid])
    user.update(user_information(user_data))
    user
  end

  def user_information(user_data)
    user_info = user_data[:info]
    {name: user_info[:name], email: user_info[:email], avatar: user_info[:image], token: user_data[:token], social_login: true}
  end

  def social_login?
    self.social_login.eql?(true)
  end
end
