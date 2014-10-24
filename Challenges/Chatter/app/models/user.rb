require 'bcrypt'
class User

	include DataMapper::Resource

	property :id, 							Serial
	property :username,					String, :unique => true, :required => true, 
															:messages => {:presence => "You need to enter a username!",
															:is_unique => "That username has already been taken"}
	property :name, 						String, :required => true, 
															:messages => {:presence => "We won't know who you are if you don't enter a name!"}
	property :email, 						String, :required => true, :unique => true, :format => :email_address, 
															:messages => {:is_unique => "This email is already taken",
															:presence => "Oops, looks like you forgot to enter your email!",
															:format => "Doesn't look like an email address to me!"}
	property :password_digest,	Text, :required => true

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

	has n, :messages

	def password=(password)
		@password = password 
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(:username => username)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end