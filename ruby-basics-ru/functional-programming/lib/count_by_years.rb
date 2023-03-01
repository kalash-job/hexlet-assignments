# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.each_with_object(Hash.new(0)) do |user, acc|
    next if user[:gender] != 'male'

    year = user[:birthday].split('-').first
    acc[year] += 1
  end
end
# END
