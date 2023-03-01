# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    hashed_body = body.each_with_object([]) do |element, hashed_data|
      hashed_data << element
      hashed_data << Digest::SHA256.hexdigest(element)
    end
    [status, headers, hashed_body]
    # END
  end
end
