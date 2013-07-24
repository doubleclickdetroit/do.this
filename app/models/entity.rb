class Entity < ActiveRecord::Base
  belongs_to :user

  has_many :tags, as: :taggable
  has_many :comments

  has_many :entity_users
  has_many :people, through: :entity_users, class_name: 'User', source: :user

  def name
    title
  end

  def has_user?(user)
    return true if user == self.user
    return true if entity_users.where(user_id: user.id).count > 0
    false
  end
end
