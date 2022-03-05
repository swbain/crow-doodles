-- initial exploration combining just friends geode + mutable instruments tides
-- mostly copied from https://gist.github.com/trentgill/f19606ad65696fd17b918b0d9126c93d

j = ii.jf

main_sequence = sequins { 0, 5/12, 7/12 }

function init()
    j.mode(1)

    input[1]{ mode = 'change'
            , direction = 'rising' 
            }

    input[2]{ mode = 'change'
    , direction = 'rising' 
    }

    input[2].change = function (count)
        output[1].volts = main_sequence()
    end
end

counter = 0
divs = 1
vox = 1

input[1].change = function (count)
    j.tick(8)

    counter = counter + 1
    if counter > 2 then
        counter = 0
        voice(vox, divs, divs)
        vox = vox + 1
        if vox > 4 then vox = 1 end
        divs = divs + 1
        if divs == 32 then divs = 1 end
    end
end

function voice( chan, divs, repeats )
    j.play_voice( chan, vtoi(divs), vtoi(repeats) )
end

function note( divs, repeats )
    j.play_note( vtoi(divs), vtoi(repeats) )
end

function vtoi(volts)
    return volts/1638.3
end