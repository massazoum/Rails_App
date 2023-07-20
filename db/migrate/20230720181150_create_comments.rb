class CreateComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, null: false, foreign_key: true
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
