require 'spec_helper'
require_relative 'helpers/session'

feature "User browses the list of available messages" do 
	before(:each) {
		Message.create(:title => "Example",
									:text => "Testing")
		User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	}

	scenario "when opening the home page" do 
		visit '/'
		sign_in('samsam', 'cat')
		add_message("Example", "Testing")
		expect(page).to have_content("Example")
	end

	scenario "with the author" do 
		visit('/')
		sign_in('samsam', 'cat')
		add_message("Example", "Testing")
		expect(page).to have_content("Sam Example Testing")
	end

end