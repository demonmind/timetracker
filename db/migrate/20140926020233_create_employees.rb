class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :uid
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
