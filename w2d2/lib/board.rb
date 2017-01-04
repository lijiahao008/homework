
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new(0) }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.map.with_index do |cup, index|
      unless index == 6 || index == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14 || start_pos < 1
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]

    ending_cup_idx = start_pos
    until stones.empty?
      ending_cup_idx += 1
      ending_cup_idx = ending_cup_idx % 14
      if ending_cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif ending_cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[ending_cup_idx] << stones.pop
      end
    end
    render
    next_turn(ending_cup_idx)

  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?}  || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    cups[6].length > cups[13].length ? @name1 : @name2
  end
end
