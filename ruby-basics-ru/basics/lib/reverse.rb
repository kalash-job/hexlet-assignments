# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = ''
  str_size = str.size
  counter = 0
  while counter < str_size
    result = "#{str[counter]}#{result}"
    counter += 1
  end
  result
end
# END
