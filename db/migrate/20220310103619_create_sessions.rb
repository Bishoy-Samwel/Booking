class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :duration
      t.references :teacher, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
