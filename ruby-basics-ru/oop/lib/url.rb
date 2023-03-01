# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable
  attr_reader :url

  def_delegators :url, :host, :scheme, :to_s

  def initialize(url)
    @url = URI(url)
  end

  def query_params
    return {} if url.query.nil?

    url.query.split('&').each_with_object({}) do |pair, params|
      key, value = pair.split('=')
      params[key.to_sym] = value
    end
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  def ==(other)
    to_s == other.to_s
  end
end
# END
