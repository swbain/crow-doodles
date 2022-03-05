-- sequencer v1
-- exploratory sequins
-- tailored for controlling mutable instruments tides
-- output 1 controls v/oct sent to tides
-- output 2 is sent to shape/level, controlling pitch relationship of tides audio output

s = sequins

root = { 0 , s {0, 1, 3, 2, 5} }
second = { 2, s {0, -3, -5, -2} }
third = { 4, s {-3, 0, -2, -5} }
fourth = { 5, s {3, 2, 0, 5} }
fifth = { 7, s {5, 2, 0, 3} }

function init()
  -- start it up
  seq = s {root, s {fourth, fifth, root}, s {third, second, root, fifth} }
  input[1].mode('change',1.0,0.1,'rising')
  input[1]. change = function (state)
    -- handle input])
    output[1].volts = seq()[1] / 12
    output[2].volts = seq()[2]()
  end
end
