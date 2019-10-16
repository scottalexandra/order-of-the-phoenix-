class Member
  attr_reader :name, :role, :house, :patronus

  def initialize(member_hash)
    @name = member_hash[:name]
    @role = member_hash[:role] || 'none'
    @house = member_hash[:house]
    @patronus = member_hash[:patronus] || 'none'
  end
end
