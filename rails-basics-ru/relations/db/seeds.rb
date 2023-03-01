# frozen_string_literal: true

['New', 'In Progress', 'Done'].each do |s|
  status = Status.create(name: s)
  puts "Add status  #{status.name}"
end

5.times do |index|
  user = User.create(name: Faker::FunnyName.name)
  puts "Add user number #{index + 1} - #{user.name}"
end

20.times do |index|
  task = Task.new(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentences.join(' ')
  )
  task.user = User.all.sample
  task.status = Status.all.sample
  task.save
  puts "Add task number #{index + 1} - #{task.name}"
end
