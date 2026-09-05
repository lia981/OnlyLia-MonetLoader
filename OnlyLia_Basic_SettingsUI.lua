script_name("OnlyLia Basic Settings UI")
script_author("OnlyLia")
script_description("Basic Settings UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

local enableFeature = imgui.new.bool(true)
local showMessage = imgui.new.bool(true)
local volume = imgui.new.int(50)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Settings UI loaded! Use /liasettings",
        -1
    )

    sampRegisterChatCommand("liasettings", function()
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
        imgui.ImVec2(420, 300),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Settings",
        window
    )

    imgui.Text("Basic Settings UI")
    imgui.Separator()

    imgui.Spacing()

    imgui.Checkbox(
        "Enable Feature",
        enableFeature
    )

    imgui.Checkbox(
        "Show Messages",
        showMessage
    )

    imgui.Spacing()

    imgui.Text("Volume")

    imgui.SliderInt(
        "##volume",
        volume,
        0,
        100
    )

    imgui.Text(
        "Current Volume: " .. volume[0]
    )

    imgui.Spacing()
    imgui.Separator()

    if imgui.Button("Test Settings") then

        if showMessage[0] then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Settings tested!",
                -1
            )
        end
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
