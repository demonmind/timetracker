class Fixcolumn < ActiveRecord::Migration
 def self.up
    rename_column :employees, :type, :emp_type
  end
end
