class SearchController < ApplicationController
  def index
    # make an api call to the characters endpoint
    # iterate over the data and grab the necessary info format as PORO
    # display that information in the view
    house = params[:house]
    response = Faraday.get("https://www.potterapi.com/v1/characters") do |req|
      req.params["key"]= ENV['harry_potter_api_key']
      req.params["house"] = house
      req.params["orderOfThePhoenix"]= true
    end

    members_data = JSON.parse(response.body, symbolize_names: true)
    members_data.each do |member_hash|
      Member.new(member_hash)
    end
  end
end
