class StatusController < ApplicationController
  def test
    render json: {
      "yo": "it's lit"
    }
  end
end
