class User < ApplicationRecord
  belongs_to :list
  validates :firstname, :lastname, :job, :position, presence: true

  scope :ordered_by_position, -> { order(:position) }

  def self.change_users_order(users)
    users.each_with_index do |user_to_update, index|
      user = User.find(user_to_update['id'])
      user.update(position: index)
    end
  end
end
