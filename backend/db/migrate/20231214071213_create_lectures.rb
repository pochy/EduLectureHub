class CreateLectures < ActiveRecord::Migration[7.1]
  def change
    create_table :lectures do |t|
      t.integer :instructor_id, limit: 5
      t.string :title
      t.integer :day_of_week, limit: 1
      t.integer :period, limit: 1

      t.timestamps
    end
  end
end
