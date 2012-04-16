load 'imyface.rb'

# puts "Welcome to IMyFace User registration!"
# puts "What is your first name?"
# first_name = gets
# puts "Ok, now what is your last name?"
# last_name = gets
# puts "Sweet! Now what do you want your User id to be?"
# user_id = gets
# puts "Awesome. Lastly, what is your top secret password?"
# password = gets

# user_1 = User.new(first_name: first_name.chomp, last_name: last_name.chomp, user_id: user_id.chomp, password: password.chomp)
@enrolled_users = UserDatabase.new()
user_1 = User.new(first_name: "Nick", last_name: "Greenfield", user_id: "Greenie0506", password: "12345")
user_2 = User.new(first_name: "Bob", last_name: "Jones", user_id: "Jonessss", password: "12345")
user_1.save(@enrolled_users)
user_2.save(@enrolled_users)

puts @enrolled_users.rows.inspect
user_2.outta_my_face("Greenie0506")

