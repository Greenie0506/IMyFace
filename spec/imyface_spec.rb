require 'bacon'
load 'imyface.rb'

describe "User" do
  describe "#initialize" do
    before do
      @user = User.new(first_name: "Sam", last_name: "Flynn", user_id: "SFlynn", password: "tron")
    end

    it "it should new up a user" do
      @user.first_name.should == "Sam"
      @user.last_name.should == "Flynn"
      @user.user_id.should == "SFlynn"
      @user.password.should == "tron"
      @user.posts == []
    end
  end

  describe"#publish_post" do
    before do
      @user = User.new(first_name: "Sam", last_name: "Flynn", password: "tron")
    end

    it "should add a post to the given user" do
      @user.posts.should.be.empty
      @user.publish_post(title: "The Grid", date: "5/14/1988", content: "I arrived at the grid")
      @user.posts.should.not.be.empty
    end
  end

  describe "#save" do
    before do
      @data_base = UserDatabase.new()
      @user = User.new(first_name: "Sam", last_name: "Flynn", password: "tron")
      @user.save(@data_base)
    end
    describe "user is not already in the database" do
      it "should add the user to the database" do
        @data_base.rows.should.not.be.empty
      end
    end

    describe "user is already in the database" do
      it "should not add the user to the database" do
        @another_user = User.new(first_name: "Sam", last_name: "Flynn", password: "tron")
        @another_user.save(@data_base)
        @data_base.rows.should.not.include @another_user
      end
    end
  end
end

describe "Post" do
  describe "#initialize" do
    before do
      @post = Post.new(title: "The Grid", date: "5/14/1988", content: "I arrived at the grid")
    end

    it "should new up a post" do
      @post.title.should == "The Grid"
      @post.date.should == "5/14/1988"
      @post.content.should == "I arrived at the grid"
    end
  end
end

describe "UserDatabase" do
  describe "#initialize" do
    it "should new up a new database" do
      @data_base = UserDatabase.new()
      @data_base.rows.should.be.empty
    end
  end

  describe "#add" do
    it "should add a user to the database rows" do
      user = User.new(first_name: "Sam", last_name: "Flynn", password: "tron")
      @data_base = UserDatabase.new()

      @data_base.rows.should.be.empty
      @data_base.add(user)
      @data_base.rows.should.not.be.empty
    end
  end
end
