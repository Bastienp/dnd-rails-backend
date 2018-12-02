class User < ApplicationRecord
  belongs_to :list
  validates :firstname, :lastname, :job, :position, presence: true

  scope :ordered_by_position, -> { order(:position) }
end
