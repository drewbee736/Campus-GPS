require "minitest/autorun"

describe User do
	before do
		@user = User.new
	end
	
	it "can create a user" do
		@user.create(name: "Bob", password: "bob")
		@user.name.must_equal "Bob"
		@user.password.must_equal "bob"
	end
	
	it "can edit a user" do
		@user.update(name: "Joe")
		@user.name.must_equal "Joe"
		@user.password.must_equal "bob"
	end
	
	it "can delete a user" do
		@user.destroy
		@user.name.must_equal nil
		@user.password.must_equal nil
	end
end
