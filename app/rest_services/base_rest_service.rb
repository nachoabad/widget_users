require 'rest-client'

class BaseRestService
  BASE_URL      = 'https://showoff-rails-react-production.herokuapp.com/'
  CLIENT_ID     = Rails.application.credentials.api[:client_id]
  CLIENT_SECRET = Rails.application.credentials.api[:secret_id]

  def initialize(path: '?', params: {}, token: nil)
    @path   = path
    @params = params
    @headers = token ? { Authorization: "Bearer #{token}" } : {}
  end

  def get
    RestClient.get url_path, @headers
  end

  def post
    byebug
    RestClient.post url_path, payload, @headers.merge({'Content-Type': 'application/json'})
  end

  private

    def url_path
      BASE_URL
    end

    def client_params
      "&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
    end

    def payload
      { "client_id": CLIENT_ID, "client_secret": CLIENT_SECRET }
    end
end
