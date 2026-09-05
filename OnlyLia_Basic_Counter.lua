script_name("OnlyLia Basic Counter")
script_author("OnlyLia")
script_description("Basic counter UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local counter = imgui.new.int(0)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Counter loaded! Use /liacounter",
        -1
    )

    sampRegisterChatCommand("liacounter", function()
        window[0] = not window[0]
    end)

    while true do
        wait(0)
    end
end

imgui.OnDrawFrame(function()
    return window[0]
end, function()

    imgui.SetNextWindowSize(
        imgui.ImVec2(400, 250),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Counter",
        window
    )

    imgui.Text("Basic Counter Learning")

    imgui.Separator()

    imgui.Spacing()

    imgui.Text(
        "Current Value: " .. counter[0]
    )

    imgui.Spacing()

    if imgui.Button("Add +1") then
        counter[0] = counter[0] + 1
    end

    imgui.SameLine()

    if imgui.Button("Remove -1") then
        counter[0] = counter[0] - 1
    end

    imgui.Spacing()

    if imgui.Button("Reset") then
        counter[0] = 0
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
