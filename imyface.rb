class UserDatabase
  attr_accessor :rows

  def initialize
    @rows = []
  end

  def add(user)
    @rows << user
  end
end

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
    new_post = Post.new(title: args[:title],
                        date: args[:date],
                        content: args[:content]
                       )
    @posts << new_post
  end

  def save(database)
    already_exists = database.rows.any? do |user|
      user.user_id == self.user_id
    end

    if already_exists
      puts "Sorry, that User ID has already been taken"
    else
      database.add(self)
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


@enrolled_users = UserDatabase.new()
