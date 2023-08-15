require 'game'

describe Game do

  it 'initializes with two players and a board' do 
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board')

    game = Game.new(player_1, player_2, board)
    
    expect(game).to be_a(Game)
  end

  it 'initially sets the current player to player_1' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board')

    game = Game.new(player_1, player_2, board)
    
    expect(game.current_player).to eq player_1
  end

end