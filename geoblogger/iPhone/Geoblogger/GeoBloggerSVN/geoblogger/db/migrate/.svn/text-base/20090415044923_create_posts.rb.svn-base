class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
