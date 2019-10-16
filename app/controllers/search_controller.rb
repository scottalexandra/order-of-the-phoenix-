class SearchController < ApplicationController
  def index
    # @facade = SearchFacade.new(params[:house])

    render locals: {
      facade: SearchFacade.new(params[:house])
    }

    @house = params[:house]
    response = Faraday.get("https://www.potterapi.com/v1/characters") do |req|
      req.params["key"]= ENV['harry_potter_api_key']
      req.params["house"] = @house
      req.params["orderOfThePhoenix"]= true
    end

    members_data = JSON.parse(response.body, symbolize_names: true)

    @members = members_data.map do |member_hash|
      Member.new(member_hash)
    end
  end
end
