class UserParserService
  def self.parse(response)
    json = JSON.parse response
    user_data = json['data']['user']
    user = OpenStruct.new(user_data)
  end
end