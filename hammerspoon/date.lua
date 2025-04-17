-- Press Cmd + Shift + D to type today's date like "April 17, 2025"
hs.hotkey.bind({"cmd", "shift"}, "D", function()
    local raw = os.date("%B %d, %Y")  -- will be like "April 07, 2025"
    local cleaned = raw:gsub(" 0", " ")  -- remove leading zero in day
    hs.eventtap.keyStrokes(cleaned)
  end)