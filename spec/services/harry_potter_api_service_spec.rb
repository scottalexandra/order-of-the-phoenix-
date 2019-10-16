require "rails_helper"

describe HarryPotterApiService do
  it "can retrieve member data by house", :vcr do
    service = HarryPotterApiService.new
    member_data = service.get_members({house: "Gryffindor"})

    expect(member_data).to be_a(Array)
    expect(member_data.first).to be_a(Hash)
    expect(member_data.first).to have_key(:name)
    expect(member_data.first).to have_key(:house)

    expect(member_data.second).to have_key(:role)
    expect(member_data.second).to have_key(:patronus)
  end
end
