# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, word_list)
  word_chars_list = get_sorted_chars(word)
  word_list.filter { |checking_word| get_sorted_chars(checking_word) == word_chars_list }
end

def get_sorted_chars(word)
  word.chars.sort
end
# END
