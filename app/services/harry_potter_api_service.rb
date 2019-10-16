class HarryPotterApiService

  def self.get_members(parameters={})
    new.get_members(parameters)
  end

  def get_members(parameters)
    all_params = default_params.merge(parameters)
    response = Faraday.get("https://www.potterapi.com/v1/characters", all_params)
    parse_json(response)
  end

  private

  attr_reader :house

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def default_params
    {
      key: ENV['harry_potter_api_key'],
      orderOfThePhoenix: true
    }
  end
end
