class WidgetParserService
  def self.parse(response)
    json = JSON.parse response
    widget_attributes = json['data']['widget'].slice('id', 'name', 'description', 'kind')
    Widget.from_hash widget_attributes
  end
end