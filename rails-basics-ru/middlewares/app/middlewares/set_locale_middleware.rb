# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    I18n.locale = extract_locale_from_accept_language_header(Rack::Request.new(env)) || I18n.default_locale
    @app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(request)
    (request.env['HTTP_ACCEPT_LANGUAGE'] || '').scan(/^[a-z]{2}/).first
  end
  # END
end
