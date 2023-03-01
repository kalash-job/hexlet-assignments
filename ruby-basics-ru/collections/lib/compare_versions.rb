# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  first = version1.split('.').map(&:to_i).reverse
  second = version2.split('.').map(&:to_i).reverse
  until first.empty?
    elem1 = first.pop
    elem2 = second.pop
    return -1 if elem1 < elem2
    return 1 if elem1 > elem2
  end
  0
end
# END
