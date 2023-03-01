# frozen_string_literal: true

# BEGIN
def fibonacci(number)
  if number.negative?
    nil
  elsif number <= 1
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end
# END
