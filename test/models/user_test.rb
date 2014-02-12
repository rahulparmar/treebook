require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
	 	user.password = "password"
	 	user.password_confirmation = "password"
	 	assert !user.save, "User was saved without a profile name"
	 	assert !user.errors[:profile_name].empty?, "User does not have a unique profile name"
	 end

	test "a user should have a profile name without spaces" do
		user = User.new
		user.profile_name = "My Profile With Spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end
	
end
