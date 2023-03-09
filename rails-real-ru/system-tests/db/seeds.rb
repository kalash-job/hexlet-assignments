# frozen_string_literal: true

10.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph_by_chars(number: 180)
  )
end

Post.all.each do |post|
  post.comments.create!(body: Faker::Lorem.paragraph_by_chars(number: 190))
end
