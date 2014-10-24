get '/' do 
	@messages = Message.all
	erb :index
end