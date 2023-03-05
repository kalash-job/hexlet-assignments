# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Imports users from CSV file'
  task :import_users, [:path] => :environment do |_, args|
    print "Task started...\n"
    path = args[:path]
    abort('Error: you should pass the path to the CSV file.') if path.nil?
    abort('Error: the path to the CSV file is incorrect.') unless File.exist?(path)
    CSV.foreach(path, headers: true) do |row|
      user_parameters = row.to_h
      user_parameters['birthday'] = Date.strptime(user_parameters['birthday'], '%m/%d/%Y')
      User.create!(user_parameters)
      print '.'
    end
    print "\n...done\n"
  end
end
