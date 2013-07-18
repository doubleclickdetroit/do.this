class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable
  has_many :relationships, as: :relatable
  has_many :users, through: :relationships

  def name
    title
  end
end
