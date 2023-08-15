class Board

  def initialize
    @board_state = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def state
    @board_state
  end

  def update_state(x, y, symbol)
    @board_state[y_element(y)][x_element(x)] = symbol
  end

  def is_empty(x, y)
    @board_state[y_element(y)][x_element(x)].nil?
  end

  private

  def x_element(x)
    x - 1
  end

  def y_element(y)
    3 - y
  end  

end