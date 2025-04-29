-- Hotkey object: starts disabled, so it only works when Chrome is front-most
local chromeNextTab = hs.hotkey.new({ "cmd" }, "1", function()
    -- Simulate Ctrl+Tab (next tab)
    hs.eventtap.keyStroke({ "ctrl" }, "tab", 0)
  end)
  
  -- Watch for application focus changes so we only enable the hotkey in Chrome
  local appWatcher = hs.application.watcher.new(function(appName, eventType)
    if appName ~= "Google Chrome" then return end
  
    if eventType == hs.application.watcher.activated then
      chromeNextTab:enable()
    elseif eventType == hs.application.watcher.deactivated
        or eventType == hs.application.watcher.terminated then
      chromeNextTab:disable()
    end
  end)
  
  appWatcher:start()
  
  -- Optional: enable the hotkey right now if Chrome is already active on reload
  if hs.application.frontmostApplication():name() == "Google Chrome" then
    chromeNextTab:enable()
  end
  