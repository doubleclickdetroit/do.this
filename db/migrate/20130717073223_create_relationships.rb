class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.references :relatable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
