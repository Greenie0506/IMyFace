class UserDatabase
  attr_accessor :rows

  def initialize
    @rows = []
  end

  def add(user)
    @rows << user
  end
end

@enrolled_users = UserDatabase.new()

class User
  attr_accessor :first_name, :last_name, :password, :posts, :user_id

  def initialize(attrs)
    @first_name = attrs[:first_name]
    @last_name = attrs[:last_name]
    @user_id = attrs[:user_id]
    @password = attrs[:password]
    @posts = []
  end

  def publish_post(args)
    new_post = Post.new(title: args[:title], date: args[:date], content: args[:content])
    @posts << new_post
  end

  def save(database)
    @enrolled_users = database

    already_exists = database.rows.any? do |user|
      user.user_id == self.user_id
    end

    if already_exists
      puts "Sorry, that User ID has already been taken"
    else
      database.add(self)
    end
  end

  def outta_my_face(user_id)
    @enrolled_users.rows.each do |u|
      if user_id == u.user_id
        u.posts << self.posts
      end
    end
  end
end

class Post
  attr_accessor :title, :date, :content

  def initialize(attrs)
    @title = attrs[:title]
    @date = attrs[:date]
    @content = attrs[:content]
  end
end

user_1 = User.new(first_name: "Nick", last_name: "Greenfield", user_id: "Greenie0506", password: "12345")
user_2 = User.new(first_name: "Bob", last_name: "Jones", user_id: "Jonessss", password: "12345")

user_1.save(@enrolled_users)
user_2.save(@enrolled_users)

user_2.publish_post(title: "First post", date: "Today", content: "HERE")

user_2.outta_my_face("Greenie0506")

