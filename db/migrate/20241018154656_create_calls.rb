class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :external_call_id
      t.string :status, null: false
      t.integer :duration
      t.string :transcript
      t.references :doctor_id ,foreign_key: { to_table: :users }, null: false, type: :uuid
      t.references :patient_id ,foreign_key: { to_table: :users }, null: false, type: :uuid

      t.timestamps
    end
  end
end
