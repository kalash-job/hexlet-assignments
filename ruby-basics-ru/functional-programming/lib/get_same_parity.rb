# frozen_string_literal: true

# BEGIN
def get_same_parity(elements)
  return elements if elements.empty?

  is_even = elements.first.even?
  elements.filter { |number| number.even? == is_even }
end
# END
