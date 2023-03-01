# frozen_string_literal: true

require 'time'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.new
    status, headers, body = @app.call(env)
    end_time = Time.new
    execution_time = "#{((end_time - start_time) * 10**6).to_i} microseconds"
    [status, headers.merge({ 'x-execution-time' => execution_time }), body]
  end
end
