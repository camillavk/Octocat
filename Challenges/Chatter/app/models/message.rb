class Message

	include DataMapper::Resource

	property :id, 							Serial
	property :title,						String
	property :text, 						Text

	belongs_to :user
	
end