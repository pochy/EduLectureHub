class AddForeignKeyToLectures < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :lectures, :users, column: :instructor_id
  end
end