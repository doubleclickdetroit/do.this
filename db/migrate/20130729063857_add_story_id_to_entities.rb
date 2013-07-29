class AddStoryIdToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :story_id, :integer
    add_index :entities, :story_id
  end
end
