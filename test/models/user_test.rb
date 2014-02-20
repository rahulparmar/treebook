require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many (:user_friendships)
	should have_many (:friends)

	 test "a user should enter a first name" do
	 	user = User.new
	 	assert !user.save
	 	assert !user.errors[:first_name].empty?, "User was saved without a first name"
	 end

	 test "a user should enter a last name" do
	 	user = User.new
	 	assert !user.save
	 	assert !user.errors[:last_name].empty?, "User was saved without a last name"
	 end


	test "a user should enter a profile name" do
	 	user = User.new
	 	assert !user.save
	 	assert !user.errors[:profile_name].empty?, "User was saved without a profile name"
	 end

	test "a user should enter a unique profile name" do
	 	user = User.new
	 	user.profile_name = "parmstar"
	 	user.email = "rahul.parmar@gmail.com"
	 	user.first_name = "Rahul"
	 	user.last_name = "Parmar"
	 	user.encrypted_password = "whatever"
	 	assert !user.save, "User was saved without a profile name"
	 	assert !user.errors[:profile_name].empty?, "User does not have a unique profile name"
	 end

	test "no error is raised when trying to get to a user's freinds" do
		assert_nothing_raised do
			users(:rahul).friends
		end
	end

	test "that creating friendships work" do
		users(:rahul).friends << users(:linnaea)
		users(:rahul).friends.reload
		assert users(:rahul).friends.include?(users(:linnaea))
	end
end
