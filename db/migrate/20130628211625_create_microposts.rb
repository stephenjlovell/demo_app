class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps  # adds the created_at and updated_at auto fields.
    end
    add_index :microposts, [:user_id, :created_at] # creates multiple-key index
  end
end
