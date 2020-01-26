class UsersRestService < BaseRestService
  USERS_PATH = 'api/v1/users/'

  private

    def url_path
      super + USERS_PATH + @path
    end

    def payload
      super.merge({'user': @params})
    end
end