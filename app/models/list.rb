class List < ApplicationRecord
  validates :title, :step , presence: true
  validates :step, uniqueness: :true
end
