# frozen_string_literal: true

10.times do |index|
  task = Task.create(
    completed: [true, false].sample,
    creator: Faker::Name.name,
    description: Faker::Lorem.sentence,
    name: Faker::Lorem.sentence,
    performer: Faker::Name.name,
    status: %w[new completed processing paused closed].sample
  )
  puts "Add task number #{index + 1} - #{task.name}"
end
