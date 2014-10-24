# require 'spec_helper'

# describe Message do 
# 	context "making sure datamapper works" do 
# 		it 'should be created and then retrieved from the db' do 
# 			expect(Message.count).to eq(0)
# 			Message.create(:title => "Example",
# 										:text => "Testing")
# 			expect(Message.count).to eq(1)
# 			message = Message.first
# 			expect(message.title).to eq("Example")
# 			expect(message.text).to eq("Testing")
# 			message.destroy
# 			expect(Message.count).to eq(0)
# 		end
# 	end
# end