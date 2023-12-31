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

  it 'updates the board after a player has made a move' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: true, update_state: nil)

    game = Game.new(player_1, player_2, board)
    result = game.make_move(2, 2)
    
    expect(result).to eq 'move made'
  end

  it 'returns false if a player tries to move to a taken square' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil)

    game = Game.new(player_1, player_2, board)
    result = game.make_move(2, 2)
    
    expect(result).to eq 'square taken'
  end

  it 'switches player from player_1 to player_2' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: true, update_state: nil)

    game = Game.new(player_1, player_2, board)
    game.switch_player
    result = game.current_player

    expect(result).to eq player_2
  end

  it 'switches player from player_2 to player_1' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil)

    game = Game.new(player_1, player_2, board)
    game.switch_player
    game.switch_player
    result = game.current_player

    expect(result).to eq player_1
  end

  it 'returns incomplete when no moves are made' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)
    result = game.status

    expect(result).to eq 'incomplete'
  end

  it 'returns incomplete when there are still fields available' do
    player_1 = double('player_1', name: 'George', symbol: 'X')
    player_2 = double('player_2', name: 'Rona', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, 'X', 'X'], ['X', 'X', 'Y'], ['Y', 'Y', 'X']])
    
    game = Game.new(player_1, player_2, board)
    result = game.status

    expect(result).to eq 'incomplete'
  end

  it 'returns complete when all the squares are filled but no one has won' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['Y', 'X', 'X'], ['X', 'X', 'Y'], ['Y', 'Y', 'X']])

    game = Game.new(player_1, player_2, board)
    result = game.status
      
    expect(result).to eq 'complete'
  end

  it 'returns complete when middle horizontal line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], ['X', 'X', 'X'], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when middle horizontal line is claimed by O' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], ['O', 'O', 'O'], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when top horizontal line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['X', 'X', 'X'], [nil, nil, nil], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when top horizontal line is claimed by O' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['O', 'O', 'O'], [nil, nil, nil], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when bottom horizontal line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], [nil, nil, nil], ['X', 'X', 'X']])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when bottom horizontal line is claimed by O' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], [nil, nil, nil], ['O', 'O', 'O']])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when first vertical line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['X', nil, nil], ['X', nil, nil], ['X', nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when second vertical line is claimed by O' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, 'O', nil], [nil, 'O', nil], [nil, 'O', nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when third vertical line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'X'], [nil, nil, 'X'], [nil, nil, 'X']])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when first diagonal line is claimed by X' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['X', nil, nil], [nil, 'X', nil], [nil, nil, 'X']])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns complete when second diagonal line is claimed by O' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'O'], [nil, 'O', nil], ['O', nil, nil]])

    game = Game.new(player_1, player_2, board)

    result = game.status
    expect(result).to eq 'complete'
  end

  it 'returns nil when game is incomplete' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])

    game = Game.new(player_1, player_2, board)

    game.status
    result = game.winner
    expect(result).to eq nil
  end

  it 'returns "Player 1 Name" when "X" claims a whole line' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [[nil, nil, 'X'], [nil, 'X', nil], ['X', nil, nil]])

    game = Game.new(player_1, player_2, board)

    game.status
    result = game.winner
    expect(result).to eq 'Player 1 Name'
  end

  it 'returns "Player 2 Name" when "O" claims a whole line' do
    player_1 = double('player_1', name: 'Player 1 Name', symbol: 'X')
    player_2 = double('player_2', name: 'Player 2 Name', symbol: 'O')
    board = double('board', is_empty: false, update_state: nil, state: [['O', 'O', 'O'], [nil, 'X', 'X'], ['X', nil, nil]])

    game = Game.new(player_1, player_2, board)

    game.status
    result = game.winner
    expect(result).to eq 'Player 2 Name'
  end
end