class StatusController < ApplicationController

  def index
    render html: "Please pass a status code in the path"
  end

  def status

    # Ensure the status is an actual status code
    # Status Codes
    # https://stackoverflow.com/questions/8890351/return-a-specific-http-status-code-in-rails
    if Rack::Utils::HTTP_STATUS_CODES[request.path_parameters[:status].to_i].nil?
      render json: {
          "error": "Please pass a proper status code as the path. Example: /status/200",
          "statuscodes": "http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/"
      }, status: 400
      return
    end

    # json in rails:
    # https://stackoverflow.com/questions/3183786/how-to-convert-a-ruby-hash-object-to-json
    response = {}

    # Play with some params
    # https://stackoverflow.com/questions/4352839/rails-how-to-get-all-parameters-from-url
    response[:status] = request.path_parameters[:status]

    request.query_parameters.each do |key,value|
      response[key] = value
    end

    request.request_parameters.each do |key,value|
      response[key] = value
    end


    # Colon Positioning
    # https://stackoverflow.com/questions/28339025/ruby-on-rails-colon-at-back-or-front-of-variables
    render json: response, status: request.path_parameters[:status]
  end
end
