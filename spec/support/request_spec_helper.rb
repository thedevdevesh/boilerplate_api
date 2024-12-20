module RequestSpecHelper
  # Helper method to parse JSON response
  def json
    JSON.parse(response.body)
  end
end
