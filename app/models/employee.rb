class Employee < ActiveRecord::Base
	has_many :timerecords

	validates_uniqueness_of :uid
end
