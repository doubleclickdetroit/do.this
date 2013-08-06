class AddTypeToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :type, :string
    add_index :entities, :type
  end
end
