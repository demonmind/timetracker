class Employee < ActiveRecord::Base
	has_many :timerecords

	validates_uniqueness_of :uid

	def timeday
		(self.timerecords.last.updated_at - self.timerecords.last.created_at)
	end

	def hourstoday
		(self.timeday/3600).to_i
	end

	def minutestoday
		((self.timeday % 3600)/60).to_i
	end

	def lastsev
		tm = (self.timerecords.limit 7).order("id ASC").pluck("updated_at, created_at").map! {|x| x[0]-x[1]}
		tm.reduce(0) do |elem, sum|
		 	elem + sum
		end
	end

	def last7hours
		(self.lastsev/3600).to_i
	end

	def last7minutes
		((self.lastsev % 3600)/60).to_i
	end
end
