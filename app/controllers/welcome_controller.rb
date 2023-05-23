require 'faraday'
require 'json'
class WelcomeController < ApplicationController
  def index
# Create a connection to the API
    conn = Faraday.new(url: 'http://api.mediastack.com/v1/news?access_key=6b7f24ff373dc8e295c63f3a8fddcd2c&date=2023-05-18&countries=in') do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    # Make a GET request to the API endpoint
    response = conn.get()

    # Parse the response body as JSON
    data = JSON.parse(response.body)
    # Access the articles from the response
    @articles = data['data']
    # Iterate over the articles and print their titles
  end
end
