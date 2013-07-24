class CreateEntityUsers < ActiveRecord::Migration
  def change
    create_table :entity_users do |t|
      t.references :entity, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
