load 'imyface.rb'

puts "Welcome to IMyFace User registration!"
puts "What is your first name?"
first_name = gets
puts "Ok, now what is your last name?"
last_name = gets
puts "Sweet! Now what do you want your User id to be?"
user_id = gets
puts "Awesome. Lastly, what is your top secret password?"
password = gets

new_user = User.new(first_name: first_name.chomp, last_name: last_name.chomp, user_id: user_id.chomp, password: password.chomp)
new_user.save(@enrolled_users)
