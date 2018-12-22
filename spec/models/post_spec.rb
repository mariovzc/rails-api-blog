# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  published  :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:title)
      should validate_presence_of(:content)
      should validate_presence_of(:published)
      should validate_presence_of(:user_id)
    end

    it 'validate relations' do
      should belong_to(:user)
    end
  end
end
