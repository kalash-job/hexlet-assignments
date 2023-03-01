# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  result = []
  for param_key in params.keys.sort
    result << "#{param_key}=#{params[param_key]}"
  end
  result.join('&')
end
# END
# rubocop:enable Style/For
