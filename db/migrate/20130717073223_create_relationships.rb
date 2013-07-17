class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.references{polymorhpic} :relatable

      t.timestamps
    end
  end
end
