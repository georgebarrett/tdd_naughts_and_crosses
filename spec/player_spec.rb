require 'player'

describe Player do

  it 'initializes with a player name' do
    player_1 = Player.new('George', 'X')
    expect(player_1.name).to eq 'George'
  end

  it 'initialzes with a player symbol' do
    player_1 = Player.new('George', 'X')
    expect(player_1.symbol).to eq 'X'
  end

end