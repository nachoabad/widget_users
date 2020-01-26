class SessionsRestService < BaseRestService
  USERS_PATH = 'oauth/'

  private

    def url_path
      super + USERS_PATH + @path
    end

    def payload
      super.merge @params
    end
end