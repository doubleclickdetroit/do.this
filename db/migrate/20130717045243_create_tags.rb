class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :user, index: true
      t.references :taggable, polymorphic: true, index: true

      t.timestamps
    end
    add_index :tags, :name
  end
end
