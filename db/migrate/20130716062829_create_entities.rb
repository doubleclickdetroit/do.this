class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :title
      t.text :note
      t.time :time
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
