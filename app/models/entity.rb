class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable

  has_many :entity_users
  has_many :people, through: :entity_users, class_name: 'User', source: :user

  def name
    title
  end
end
