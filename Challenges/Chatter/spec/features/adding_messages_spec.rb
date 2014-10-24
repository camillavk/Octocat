require 'spec_helper'
require_relative 'helpers/session'

feature "User adds a link" do 
	before(:each) do 
		User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	end

	scenario "when browsing the homepage" do 
		expect(Message.count).to eq(0)
		visit '/'
		sign_in('samsam', 'cat')
		add_message("example", "testing")
		expect(Message.count).to eq(1)
		message = Message.first
		expect(message.title).to eq("example")
	end



end