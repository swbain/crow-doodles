-- testing out jf events, requesting values via druid
function init ()
    ii.jf.event = function(e, value)
        print(e.name .. " " .. value)
    end
end