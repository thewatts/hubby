class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author_email
      t.string :author_name
      t.string :author_username
      t.text :message
      t.string :repository_url
      t.datetime :timestamp
      t.integer :event
      t.text :meta

      t.timestamps null: false
    end
  end
end
