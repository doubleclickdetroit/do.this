class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable

  def name
    title
  end
end
