require 'rails_helper'

 describe User do
 
   describe ".top_rated" do
 
     before do
       @user1 = create(:user)
       post = create(:post, user: @user1)
       create(:comment, user: @user1, post: post)
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end

   describe "user with post and comment" do

     before do
      @user = create(:user_with_post_and_comment)
     end

     it "returns one post on user_with_post_and_comment" do
      expect( @user.posts.count ).to eq(1)
     end

     it "returns one comment on user_with_post_and_comment" do
      expect( @user.comments.count ).to eq(1)
     end
  end
 end