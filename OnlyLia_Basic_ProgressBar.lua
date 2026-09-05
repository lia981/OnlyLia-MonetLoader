script_name("OnlyLia Basic Progress Bar")
script_author("OnlyLia")
script_description("Basic progress bar UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local progress = imgui.new.float(0.0)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Progress Bar loaded! Use /liaprogress",
        -1
    )

    sampRegisterChatCommand("liaprogress", function()
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
        "OnlyLia Basic Progress Bar",
        window
    )

    imgui.Text("Basic Progress Bar Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text(
        "Progress: " .. math.floor(progress[0] * 100) .. "%"
    )

    imgui.ProgressBar(
        progress[0],
        imgui.ImVec2(-1, 25)
    )

    imgui.Spacing()

    if imgui.Button("Add 10%") then
        progress[0] = math.min(
            progress[0] + 0.1,
            1.0
        )
    end

    imgui.SameLine()

    if imgui.Button("Remove 10%") then
        progress[0] = math.max(
            progress[0] - 0.1,
            0.0
        )
    end

    imgui.Spacing()

    if imgui.Button("Complete") then
        progress[0] = 1.0
    end

    imgui.SameLine()

    if imgui.Button("Reset") then
        progress[0] = 0.0
    end

    imgui.Spacing()
    imgui.Separator()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
