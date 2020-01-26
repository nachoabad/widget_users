class WidgetsParserService
  def self.parse(response)
    json = JSON.parse response
    widgets_data = json['data']['widgets']
    
    widgets = []
    widgets_data.each do |widget|
      widgets << OpenStruct.new(widget)
    end
    widgets
  end
end