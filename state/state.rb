# Description: This class is responsible for the game state
class GameState
  attr_reader :state, :current_player

  def initialize
    @state = '_________'

    @all_triples = %w[
      123 456 789
      147 258 369
      159 357
    ]

    @current_player = P1

    @past_moves = []
    @replay_file = "replays/#{Time.now.strftime('%Y%m%d%H%M%S')}"
  end

  def valid_move?(position)
    @state[position - 1] == '_'
  end

  def insert_sign(position)
    @state[position - 1] = @current_player
    @all_triples.map do |triple|
      triple.gsub!(position.to_s, @current_player)
    end
    @past_moves << @state.dup
  end

  def check_win_condition
    @all_triples.each do |triple|
      return P1 if triple == "#{P1}#{P1}#{P1}"
      return P2 if triple == "#{P2}#{P2}#{P2}"
    end
    return 'D' if draw?

    'N'
  end

  def draw?
    count = 0
    @all_triples.each do |triple|
      count += 1 if triple.include?(P1) && triple.include?(P2)
    end

    return false unless count == 8

    true
  end

  def next_player
    @current_player = @current_player == P1 ? P2 : P1
  end

  def save_replay
    File.open(@replay_file, 'w') do |file|
      file.puts @past_moves
    end
  end
end
