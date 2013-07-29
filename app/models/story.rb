class Story < ActiveRecord::Base
  belongs_to :user

  has_many :entities
  has_many :tags, as: :taggable
end
