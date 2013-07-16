class Entity < ActiveRecord::Base
  belongs_to :user

  def name
    title
  end
end
