class Story < ActiveRecord::Base
  belongs_to :user

  has_many :entities
  has_many :tags, as: :taggable

  has_many :story_users
  has_many :people, through: :story_users, class_name: 'User', source: :user
end
