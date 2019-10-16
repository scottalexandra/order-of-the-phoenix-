class SearchController < ApplicationController
  def index
    # make an api call to the characters endpoint
    # iterate over the data and grab the necessary info
    # format that data as a PORO
    # display that information in the view

    response = Faraday.get("https://www.potterapi.com/v1/characters") do |req|
      req.params["key"]= ENV['harry_potter_api_key']
      req.params["house"] = "Gryffindor"
      req.params["orderOfThePhoenix"]= true
    end


  end
end
