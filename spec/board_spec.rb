require 'board'

describe Board do

  it 'initializes with a 3 by 3 array of arrays with all squares having the value of nil' do
    board = Board.new
    result = board.state

    expect(result[0]).to eq [nil, nil, nil]
    expect(result[1]).to eq [nil, nil, nil]
    expect(result[2]).to eq [nil, nil, nil]
  end

  it 'updates the state of the board with the first move (X)' do
    board = Board.new
    board.update_state(1, 1, 'X')
    result = board.state

    expect(result[0]).to eq [nil, nil, nil]
    expect(result[1]).to eq [nil, nil, nil]
    expect(result[2]).to eq ['X', nil, nil]
  end

  it 'updates the board with the second move from player 2 (O)' do
    board = Board.new
    board.update_state(1, 1, 'X')
    board.update_state(3, 3, 'O')
    result = board.state

    expect(result[0]).to eq [nil, nil, 'O']
    expect(result[1]).to eq [nil, nil, nil]
    expect(result[2]).to eq ['X', nil, nil]
  end

end