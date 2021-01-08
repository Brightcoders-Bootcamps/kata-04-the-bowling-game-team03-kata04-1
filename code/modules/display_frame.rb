# This module is made for frame print
module DisplayFrame
  def DisplayFrame.print_frame
    $frames_instances.each do |frame|
      print "Frame #{frame.id} \n pins_knocked_down: #{frame.pins_knocked_down} Spare #{frame.spare} Strike #{frame.strike}"
      print " Score: #{frame.score} total_score #{frame.total_score} \n"
    end
  end
end