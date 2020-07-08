hotKeys = {
    { { "ctrl" }, "3", function() hs.application.launchOrFocus("Telegram") end },
    { { "ctrl" }, "4", function() hs.application.launchOrFocus("Brave Browser") end },
    { { "ctrl" }, "5", function() hs.application.launchOrFocus("Iterm") end },
    { { "ctrl" }, "6", function() hs.application.launchOrFocus("Pycharm") end },
    { { "ctrl" }, "7", function() hs.application.launchOrFocus("Visual Studio Code") end },
}

-- https://github.com/callum-oakley/macos-dots/blob/master/.config/hammerspoon/init.lua
hotKeysExpanded = {}
for _, hotKey in ipairs(hotKeys) do
    local mods = {}
    for _, mod in ipairs(hotKey[1]) do
        if mod == "cmd" then
            mods.cmd = true
        elseif mod == "alt" then
            mods.alt = true
        elseif mod == "ctrl" then
            mods.ctrl = true
        elseif mod == "shift" then
            mods.shift = true
        end
    end
    table.insert(hotKeysExpanded, {
        mods = mods,
        keyCode = hs.keycodes.map[hotKey[2]],
        f = hotKey[3],
    })
end

keyDownTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local mods = hs.eventtap.checkKeyboardModifiers()
    for _, hotKey in ipairs(hotKeysExpanded) do
        if e:getKeyCode() == hotKey.keyCode and
            mods.cmd == hotKey.mods.cmd and
            mods.alt == hotKey.mods.alt and
            mods.ctrl == hotKey.mods.ctrl and
            mods.shift == hotKey.mods.shift then
            hotKey.f()
            return true
        end
    end
end):start()
