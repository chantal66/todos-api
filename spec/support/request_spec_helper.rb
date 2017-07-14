
module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end
  # this method parses JSON response into a ruby hash
end