class Entity
  include ActsAsTree
  extend  ActsAsTree::Presentation

  acts_as_tree order: :title
  # ^ belongs_to :parent
  # ^ has_many :children

  has_many :relationships
  has_many :people, through: :relationships, class_name: 'User', source: :user

  after_update :update_relationship_dates

private
  # places Associaton in timeline where the 
  # referenced Entity should be located
  def update_relationship_dates
    return true if self.is_a? Relationship

    relationships.each do |ass|
      ass.date = self.date
      ass.save
    end
  end
end

class Story < Entity
  # grabs all constituent Entities
  # excludes .people (Relationships)
  def entities
    children.where.not type: 'Relationship'
  end
end

class Relationship < Entity
  alias :entity :parent
end
