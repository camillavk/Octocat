require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do 

	scenario "when logged out" do 
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, Sam")
		expect(User.first.email).to eq("sam@example.com")
	end

	scenario "with a password that doesn't match" do 
		expect{ sign_up("Sam", "samsam", "s@s.com", "pass", "wrong") }.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do 
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This email is already taken")
	end

end

feature "User signs in" do 
	before(:each) do 
		User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	end

	scenario "with correct credentials" do 
		visit '/'
		expect(page).not_to have_content("Welcome, Sam")
		sign_in('samsam', 'cat')
		expect(page).to have_content("Welcome, Sam")
	end

	scenario "with incorrect credentials" do 
		visit '/'
		expect(page).not_to have_content("Welcome, Sam")
		sign_in('samsam', 'dog')
		expect(page).not_to have_content("Welcome, Sam")
	end

end

feature "User signs out" do 
	before(:each) do 
		User.create(:name => "Sam",
								:username => 'samsam',
								:email => "sam@example.com",
								:password => "cat",
								:password_confirmation => "cat")
	end

	scenario "while being signed in" do 
		sign_in('samsam', 'cat')
		click_button "Sign out"
		expect(page).to have_content("Goodbye!")
		expect(page).not_to have_content("Welcome, Sam")
	end

end