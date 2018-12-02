class User < ApplicationRecord
  belongs_to :list
  validates :firstname, :lastname, :job, :position, presence: true
end
