class Story < ActiveRecord::Base
  belongs_to :user
  has_many :entities
end
