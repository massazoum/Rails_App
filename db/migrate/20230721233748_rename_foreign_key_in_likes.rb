# db/migrate/YYYYMMDDHHMMSS_rename_foreign_key_in_likes.rb
class RenameForeignKeyInLikes < ActiveRecord::Migration[7.0]
  def change
    # Check if the foreign key constraint with the name "fk_rails_..._users_id" exists
    if foreign_key_exists?(:likes, :users_id)
      remove_foreign_key :likes, :users

      # Add the new foreign key constraint with the correct column name
      add_foreign_key :likes, :users, column: :author_id
    end
  end
end
