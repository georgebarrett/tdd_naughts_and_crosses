class Game

  attr_accessor :current_player

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = player_1
    @winner_symbol = nil
  end

  def make_move(x, y)
    if @board.is_empty(x, y)
      @board.update_state(x, y, @current_player.symbol)
      return 'move made'
    else
      'square taken'
    end
  end

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def status
    if horizontal_win || vertical_win || diagonal_win || board_filled
      'complete'
    else
      'incomplete'
    end
  end

  def winner
    case @winner
      when nil
        nil
    end     
  end

  private

  def winning_line?(array)
    has_won = array.uniq.length == 1 && array.include?(nil) == false
    @winner_symbol = array[0] if has_won
    return has_won
  end

  def horizontal_win
    @board.state.any? do |row|
      winning_line?(row)
    end
  end

  def vertical_win
    @board.state[0].each_with_index.any? do |element, index|
      vertical = @board.state.map do |row|
        row[index]
      end
      winning_line?(vertical)
    end
  end

  def diagonal_win
    board_size = @board.state.size
    
    first_diagonal = (0...board_size).map { |i| @board.state[i][i] }
    return true if winning_line?(first_diagonal)

    second_diagonal = (0...board_size).map { |i| @board.state[i][board_size - i - 1] }
    return true if winning_line?(second_diagonal)

    false
  end

  def board_filled
    @board.state.none? { |row| row.include?(nil) }
  end

end