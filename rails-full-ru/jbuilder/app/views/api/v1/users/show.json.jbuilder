# frozen_string_literal: true

json.user do
  json.id @user.id
  json.email @user.email
  json.address @user.address
  json.full_name "#{@user.first_name} #{@user.last_name}"
  json.posts @user.posts, partial: 'posts', as: :post
end
