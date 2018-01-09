class StatusController < ApplicationController

  def index
    render html: "Please pass a status code in the path"
  end

  def status



    # json in rails:
    # https://stackoverflow.com/questions/3183786/how-to-convert-a-ruby-hash-object-to-json
    response = {}

    # Play with some params
    # https://stackoverflow.com/questions/4352839/rails-how-to-get-all-parameters-from-url
    response[:status] = request.path_parameters[:status]

    request.query_parameters.each do |key,value|
      Rails.logger.debug "Param #{key}: #{value}"
      response[key] = value
    end


    # Colon Positioning
    # https://stackoverflow.com/questions/28339025/ruby-on-rails-colon-at-back-or-front-of-variables
    render json: response, status: request.path_parameters[:status]
  end
end
