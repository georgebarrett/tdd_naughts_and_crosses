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

  it 'makes updates the board after a player has made a move' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: true, update_state: nil)

    game = Game.new(player_1, player_2, board)
    result = game.make_move(2, 2)
    
    expect(result).to eq 'move made'
  end
end