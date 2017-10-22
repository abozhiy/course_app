class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.float :value
      t.datetime :valid_to

      t.timestamps null: false
    end
  end
end
