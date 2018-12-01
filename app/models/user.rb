class User < ApplicationRecord
  belongs_to :list
  validates :firstname, :lastname, :job, presence: true
end
