load "libs/frame.rb"
require_relative "modules/utils_frame"
require_relative "modules/display_frame"

$frames_instances = Array.new

(1..10).each { |counter|
  pins_knocked_down = UtilsFrame.get_pins_knocked_down
  first_score = pins_knocked_down[0] + pins_knocked_down[1]
  spare = (UtilsFrame.get_spare_or_strike(pins_knocked_down) === 2) ? true : false
  strike = (UtilsFrame.get_spare_or_strike(pins_knocked_down) === 1) ? true : false
  frame_obj = {"score" => first_score, "pins_knocked_down" => pins_knocked_down, "spare" => spare, "strike" => strike, "bonus" => nil, "total_score" => nil}
  Frame.new(frame_obj)
}

is_spare_or_strike = false
$frames_instances.each { |frame|
  is_spare_or_strike = true if (frame.spare || frame.strike)
  if (frame.id != 10)
    if frame.spare
      frame.bonus = $frames_instances[frame.id].pins_knocked_down[0]
      frame.score += frame.bonus
    elsif frame.strike
      frame.bonus = $frames_instances[frame.id].pins_knocked_down.compact.reduce { |sum, elem| sum += elem }
      frame.score += frame.bonus
    end
  end
  if frame.id == 10 && is_spare_or_strike
    if (frame.spare || frame.strike)
      third = 0
      fourth = 0
      fifth = 0
      third = rand(0..(10))
      frame.bonus = third + fourth + fifth
      frame.pins_knocked_down = [frame.pins_knocked_down[0], frame.pins_knocked_down[1], third, fourth, fifth]
      frame.score = frame.pins_knocked_down.compact.reduce { |sum, elem| sum += elem }
    end
  end
  frame.total_score = (frame.id > 1) ? frame.score + $frames_instances[frame.id - 2].total_score.to_i : frame.score
}
DisplayFrame.print_frame