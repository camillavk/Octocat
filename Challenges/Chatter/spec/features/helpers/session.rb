module SessionHelpers

	def sign_up(name = "Sam",
							username = "samsam",
							email = "sam@example.com",
							password = "cat",
							password_confirmation = "cat")
		visit '/users/new'
		fill_in :name, :with => name
		fill_in :username, :with => username
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up"
	end

	def sign_in(username, password)
	visit '/sessions/new'
	fill_in :username, :with => username
	fill_in :password, :with => password
	click_button "Sign in"
	end

	def add_message(title, text)
		visit 'messages/new'
		fill_in 'title', :with => title
		fill_in 'text', :with => text
		click_button "Add message"
	end

end