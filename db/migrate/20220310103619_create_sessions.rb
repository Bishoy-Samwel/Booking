class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.dateTime :start_time
      t.dateTime :end_time
      t.decimal :duration
      t.references :teacher, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
