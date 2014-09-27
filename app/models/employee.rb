class Employee < ActiveRecord::Base
	has_many :timerecords
end
