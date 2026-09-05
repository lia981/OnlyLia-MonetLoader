script_name("OnlyLia Basic Toggle UI")
script_author("OnlyLia")
script_description("Basic toggle UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

local featureA = imgui.new.bool(false)
local featureB = imgui.new.bool(false)
local featureC = imgui.new.bool(false)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Toggle UI loaded! Use /liatoggle",
        -1
    )

    sampRegisterChatCommand("liatoggle", function()
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
        "OnlyLia Basic Toggle UI",
        window
    )

    imgui.Text("Basic Toggle Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Checkbox(
        "Feature A",
        featureA
    )

    imgui.Checkbox(
        "Feature B",
        featureB
    )

    imgui.Checkbox(
        "Feature C",
        featureC
    )

    imgui.Spacing()
    imgui.Separator()

    imgui.Text("Current Status:")

    imgui.Text(
        "Feature A: " ..
        (featureA[0] and "ON" or "OFF")
    )

    imgui.Text(
        "Feature B: " ..
        (featureB[0] and "ON" or "OFF")
    )

    imgui.Text(
        "Feature C: " ..
        (featureC[0] and "ON" or "OFF")
    )

    imgui.Spacing()

    if imgui.Button("Send Status") then

        local status =
            "A: " .. (featureA[0] and "ON" or "OFF") ..
            " | B: " .. (featureB[0] and "ON" or "OFF") ..
            " | C: " .. (featureC[0] and "ON" or "OFF")

        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}" .. status,
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
