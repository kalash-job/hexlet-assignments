# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_empty_stack_creation
    @stack = Stack.new
    assert { @stack.empty? }
    assert { @stack.to_a == [] }
  end

  def test_stack_creation
    @stack = Stack.new(%w[ruby php java])
    assert { @stack.to_a == %w[ruby php java] }
  end

  def test_stack_push
    @stack = Stack.new
    @stack.push! 'ruby'
    @stack.push! 'php'
    @stack.push! 'java'
    assert { @stack.to_a == %w[ruby php java] }
    assert { @stack.size == 3 }
    refute { @stack.empty? }
  end

  def test_stack_pop
    @stack = Stack.new(%w[ruby php java])
    element = @stack.pop!
    assert { @stack.to_a == %w[ruby php] }
    assert { element == 'java' }
  end

  def test_stack_clear
    @stack = Stack.new(%w[ruby php java])
    @stack.clear!
    assert { @stack.to_a == [] }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
