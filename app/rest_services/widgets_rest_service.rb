class WidgetsRestService < BaseRestService
  WIDGETS_PATH = 'api/v1/widgets/'

  private

    def url_path
      super + WIDGETS_PATH + @path + client_params
    end

    def payload
      super.merge({'widget': @params})
    end
end