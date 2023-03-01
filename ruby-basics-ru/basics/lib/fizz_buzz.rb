# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if start > stop

  result = []
  while start <= stop
    element = ''
    element = 'Fizz' if (start % 3).zero?
    element = "#{element}Buzz" if (start % 5).zero?
    result << (element.empty? ? start.to_s : element)
    start += 1
  end
  result.join(' ')
end
# END
