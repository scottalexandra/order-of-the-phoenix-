class SearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def member_count
    members_by_house.count
  end

  def members_by_house
    parameters = {house: house}
    members_data = HarryPotterApiService.get_members(parameters)
    create_members(members_data)
  end

  def all_members
    members_data = HarryPotterApiService.get_members
    create_members(members_data)
  end

  def create_members(members_data)
    members_data.map do |member_hash|
      Member.new(member_hash)
    end
  end
end
