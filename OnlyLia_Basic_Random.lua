script_name("OnlyLia Basic Random Generator")
script_author("OnlyLia")
script_description("Basic random number generator learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local minValue = imgui.new.int(1)
local maxValue = imgui.new.int(100)

local result = 0
local hasResult = false

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Random Generator loaded! Use /liarandom",
        -1
    )

    sampRegisterChatCommand("liarandom", function()
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
        imgui.ImVec2(420, 270),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Random Generator",
        window
    )

    imgui.Text("Basic Random Generator Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.InputInt(
        "Minimum",
        minValue
    )

    imgui.InputInt(
        "Maximum",
        maxValue
    )

    imgui.Spacing()

    if imgui.Button("Generate Random Number") then

        if minValue[0] <= maxValue[0] then
            result = math.random(
                minValue[0],
                maxValue[0]
            )

            hasResult = true
        end
    end

    imgui.Spacing()
    imgui.Separator()

    if hasResult then
        imgui.Text(
            "Random Result: " .. result
        )
    else
        imgui.Text(
            "Random Result: No result yet"
        )
    end

    imgui.Spacing()

    if imgui.Button("Send Result") then

        if hasResult then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Random Result: " ..
                result,
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
