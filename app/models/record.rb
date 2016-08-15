# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  title      :string
#  date       :date
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Record < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
end
