class StatusController < ApplicationController
  def test

    # json in rails:
    # https://stackoverflow.com/questions/3183786/how-to-convert-a-ruby-hash-object-to-json
    response = {}

    # Play with some params
    # https://stackoverflow.com/questions/4352839/rails-how-to-get-all-parameters-from-url
    response[:status] = request.path_parameters[:status]

    request.query_parameters.each do |key,value|
      Rails.logger.warn "Param #{key}: #{value}"
      response[key] = value
    end

    render json: response
  end
end
