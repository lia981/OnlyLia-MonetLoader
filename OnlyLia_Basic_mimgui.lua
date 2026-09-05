script_name("OnlyLia Basic mimgui UI")
script_author("OnlyLia")
script_description("Basic mimgui UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic mimgui UI loaded! Use /liaui",
        -1
    )

    sampRegisterChatCommand("liaui", function()
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
        imgui.ImVec2(420, 250),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic UI",
        window
    )

    imgui.Text("Welcome to OnlyLia Basic mimgui UI")

    imgui.Separator()

    imgui.Text("This script is made for learning basic mimgui.")

    imgui.Spacing()

    if imgui.Button("Send Hello") then
        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Hello from mimgui!",
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
