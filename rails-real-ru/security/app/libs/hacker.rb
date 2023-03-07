# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      sign_up_url = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      user_create_url = 'https://rails-collective-blog-ru.hexlet.app/users'

      sign_up_response = Net::HTTP.get_response(URI.parse(sign_up_url))
      cookies = sign_up_response['set-cookie']
      sign_up_page = Nokogiri::HTML(sign_up_response.body)
      authenticity_token = sign_up_page.css('input[name=authenticity_token]').first.to_h.fetch('value')

      Net::HTTP.post(
        URI.parse(user_create_url),
        URI.encode_www_form(
          'authenticity_token' => authenticity_token,
          'user[email]' => email,
          'user[password]' => password,
          'user[password_confirmation]' => password,
          'commit' => 'Регистрация'
        ),
        {
          'Cookie' => cookies,
          'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/110.0',
          'Content-Type' => 'application/x-www-form-urlencoded'
        }
      )
    end
    # END
  end
end
