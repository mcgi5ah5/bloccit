FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now

     factory :user_with_post_and_comment do  
        after(:create) do |user|
          post = create(:post, user: user)
          comment = create(:comment, post: post, user:user)
        end
      end

   end
 end