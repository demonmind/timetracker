class CreateTimerecords < ActiveRecord::Migration
  def change
    create_table :timerecords do |t|
      t.date :date
      t.time :in_time
      t.time :out_time
      t.integer :employee_id

      t.timestamps
    end
  end
end
