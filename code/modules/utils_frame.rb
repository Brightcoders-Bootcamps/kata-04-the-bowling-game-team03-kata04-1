# Frmae utilies methods
module UtilsFrame
  def UtilsFrame.get_pins_knocked_down
    first = rand(0..10)
    second = (first == 10) ? 0 : (rand(0..(10 - first)))
    return [first, second]
  end

  def UtilsFrame.get_spare_or_strike(pins_knocked_down)
    first_try, second_try = pins_knocked_down
    return 1 if first_try == 10 #It's Strike
    return 2 if first_try != 10 && (first_try + second_try == 10) #It's Spare
    return #Isn't Strike or Spare
  end
end