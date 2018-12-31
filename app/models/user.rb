# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  auth_token :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :posts

  validates :email, presence: true
  validates :name, presence: true
  validates :auth_token, presence: true

  after_initialize :generate_auth_token

  def generate_auth_token
    # User.new
    # if !auth_token.present?
    unless auth_token.present?
      # generate token
      self.auth_token = TokenGenerationService.generate
    end
  end
end
