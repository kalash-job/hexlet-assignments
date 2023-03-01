# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(params = {})
    @attributes = {}
    self.class.attributes_scheme.each do |name, options|
      next @attributes[name] = options.fetch(:default, nil) if params.fetch(name, nil).nil?

      @attributes[name] = to_type(params[name], options)
    end
  end

  module ClassMethods
    def attribute(name, options = {})
      @attributes_scheme ||= {}
      @attributes_scheme[name] = options
      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = value.nil? ? value : to_type(value, options)
      end
    end

    def attributes_scheme
      @attributes_scheme
    end
  end

  def attributes
    @attributes
  end

  private

  def to_type(attribute, options)
    return attribute unless options.key?(:type)

    case options[:type]
    when :string then attribute.to_s
    when :integer then attribute.to_i
    when :boolean then !!attribute
    when :datetime then DateTime.parse(attribute.to_s)
    end
  end
end
# END
