class CreateStoryUsers < ActiveRecord::Migration
  def change
    create_table :story_users do |t|
      t.references :story, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
