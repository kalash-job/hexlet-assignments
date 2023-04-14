# frozen_string_literal: true

json.array! @users do |user|
  json.full_name "#{user.first_name} #{user.last_name}"
  json.url api_v1_user_url(user, format: :json)
end
