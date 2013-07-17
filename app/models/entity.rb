class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable
  has_many :relationships, as: :relatable

  def name
    title
  end
end
