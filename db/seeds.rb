 require 'faker'
 
 # Create Posts
 50.times do
   Advertisement.create!(
     title:  Faker::Lorem.sentence,
     copy:   Faker::Lorem.paragraph,
     price:  Faker::Commerce.price
   )
 end
 
 
 puts "Seed finished"
 puts "#{Advertisement.count} advertisements created"
