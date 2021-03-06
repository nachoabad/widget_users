class MyWidgetsController < ApplicationController
  def show
    args = { path: 'me/widgets?', token: session[:access_token] }
    response = UsersRestService.new(args).get
    @widgets = WidgetsParserService.parse(response)
  end
end