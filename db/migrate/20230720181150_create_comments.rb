# class CreateComments < ActiveRecord::Migration[7.0]
#   def change
#     create_table :comments do |t|
#       t.references :user, null: false, foreign_key: true
#       t.references :post, null: false, foreign_key: true
#       t.text :text

#       t.timestamps
#     end

#     add_reference :comments, :author, null: false, foreign_key: true
#   end
# end
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end