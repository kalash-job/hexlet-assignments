# frozen_string_literal: true

20.times do |index|
  post = Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.sentences.join(' '),
    summary: Faker::Lorem.sentence,
    published: [true, false].sample
  )
  puts "Add post number #{index + 1} - #{post.title}"
end
