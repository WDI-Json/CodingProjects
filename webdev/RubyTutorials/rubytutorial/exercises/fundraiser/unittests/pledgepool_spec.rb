require_relative '../pledgepool'

describe Pledgepool do

  before do
    @pledge = Pledge.new(:gold, 100)
  end

  it "has a name attribute" do
    expect(@pledge.name).to eq(:gold)
  end

  it "has a points attribute" do
    expect(@pledge.amount).to eq(100)
  end

  it "has three catagories" do
    expect(Pledgepool::PLEDGES.length).to eq(3)
  end

  it "has a pie worth 5 points" do
    expect(Pledgepool::PLEDGES[0]).to eq(Pledge.new(:bronze, 50))
  end

  it "has a bottle worth 25 points" do
    expect(Pledgepool::PLEDGES[1]).to eq(Pledge.new(:silver, 75))
  end

  it "has a hammer worth 50 points" do
    expect(Pledgepool::PLEDGES[2]).to eq(Pledge.new(:gold, 100))
  end

#   it "returns a random treasure" do
#     treasure = TreasureTrove.random
#     expect(Pledgepool::PLEDGES).to include(treasure)
#   end

end