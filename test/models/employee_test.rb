require 'spec_helper'
require 'rails_helper'

describe Employee, '#timeday' do
	let(:emp) {Employee.create(uid: 123456, fname: 'test', lname: 'subject')}
	it 'returns the time an employee worked in a day from clock in to clock out' do
		timecard
		result = emp.timeday
		expect(result).to eq 7320
	end
end

describe Employee, '#hourstoday' do
	let(:emp) {Employee.create(uid: 123456, fname: 'test', lname: 'subject')}
	it 'returns the hours of employee for 1 day' do
		timecard
		result = emp.hourstoday
		expect(result).to eq 2
	end
end

describe Employee, '#minutestoday' do
	let(:emp) {Employee.create(uid: 123456, fname: 'test', lname: 'subject')}
	it 'returns the minutes of employee for 1 day' do
		timecard
		result = emp.hourstoday
		expect(result).to eq 2
	end
end

def timecard
	emp.timerecords.create(in_time: '09:00', out_time: '11:02')
end