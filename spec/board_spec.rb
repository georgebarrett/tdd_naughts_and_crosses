require 'board'

describe Board do

  it 'initializes with a 3 by 3 array of arrays with all squares having the value of nil' do
    board = Board.new
    result = board.state
    expect(result[0]).to eq [nil, nil, nil]
    expect(result[1]).to eq [nil, nil, nil]
    expect(result[2]).to eq [nil, nil, nil]
  end

end