# frozen_string_literal: true

10.times do |index|
  post = Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.sentences.join(' '))
  puts "Add post #{index + 1} - #{post.title}"
end

Post.all.each do |post|
  [2, 10].sample.times do
    comment = post.comments.build(body: Faker::Lorem.sentence)
    comment.save
    puts "Add comment for #{post.title}"
  end
end
