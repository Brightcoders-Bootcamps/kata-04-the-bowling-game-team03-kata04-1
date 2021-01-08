require_relative "../libs/frame"
#test/frame_spec.rb
RSpec.describe Frame do
  $frames_instances = []
  frame_obj = { "score" => 5, "pins_knocked_down" => [3, 2], "spare" => false, "strike" => false, "bonus" => nil, "total_score" => nil }
  let(:first_frame) { Frame.new(frame_obj) }
  frame_obj2 = { "score" => 10, "pins_knocked_down" => [3, 7], "spare" => true, "strike" => false, "bonus" => nil, "total_score" => nil }
  let(:second_frame) { Frame.new(frame_obj2) }
  frame_obj3 = { "score" => 10, "pins_knocked_down" => [10, 0], "spare" => false, "strike" => true, "bonus" => nil, "total_score" => nil }
  let(:third_frame) { Frame.new(frame_obj3) }

  describe "on new frame" do
    it "Score es equal to pins_knocked_down's elemnts sum" do
      expect(first_frame.score).to eq(first_frame.pins_knocked_down.compact.reduce { |sum, elem| sum += elem })
    end

    it "frame with spare has 10 points in first score" do
      expect([second_frame.score, second_frame.strike, second_frame.spare,]).to eq([10, false, true])
    end

    it "frame with strike has 10 points in pins_knocked_down first position is 10 and second pos is 0" do
      expect([third_frame.pins_knocked_down, third_frame.strike, third_frame.spare]).to eq([[10, 0], true, false])
    end
  end
end
