class Employee < ActiveRecord::Base
	has_many :timerecords, :dependent => :destroy

	validates_uniqueness_of :uid

	def timeday
		(self.timerecords.last.out_time - self.timerecords.last.in_time)
	end

	def hourstoday
		(self.timeday/3600).to_i
	end

	def minutestoday
		((self.timeday % 3600)/60).to_i
	end

	def lastsev
		tm = (self.timerecords.order("id DESC").limit 7).pluck("out_time, in_time").map! {|x| x[0]-x[1]}
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
