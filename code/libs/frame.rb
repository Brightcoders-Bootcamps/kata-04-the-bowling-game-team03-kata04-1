require_relative "../modules/display_frame"

# define class Frame
class Frame
  attr_reader :score
  attr_reader :pins_knocked_down
  attr_reader :spare
  attr_reader :strike
  attr_reader :bonus
  attr_reader :total_score

  def initialize(frame_obj)
    @id = $frames_instances.length + 1
    @score = frame_obj["score"]
    @pins_knocked_down = frame_obj["pins_knocked_down"]
    @spare = frame_obj["spare"]
    @strike = frame_obj["strike"]
    @bonus = frame_obj["bonus"]
    @total_score = frame_obj["total_score"]
    $frames_instances << self
  end

  # Getters
  def id
    @id
  end

  def score
    @score
  end

  def pins_knocked_down
    @pins_knocked_down
  end

  def spare
    @spare
  end

  def strike
    @strike
  end

  def bonus
    @bonus
  end

  def total_score
    @total_score
  end

  #setters
  def score=(score)
    @score = score
  end

  def pins_knocked_down=(pins_knocked_down)
    @pins_knocked_down = pins_knocked_down
  end

  def spare=(spare)
    @spare = spare
  end

  def strike=(strike)
    @strike = strike
  end

  def bonus=(bonus)
    @bonus = bonus
  end

  def total_score=(total_score)
    @total_score = total_score
  end
end