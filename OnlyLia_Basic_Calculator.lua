script_name("OnlyLia Basic Calculator")
script_author("OnlyLia")
script_description("Basic calculator UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

local numberA = imgui.new.float(0.0)
local numberB = imgui.new.float(0.0)

local result = 0.0
local operation = "No calculation yet"

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Calculator loaded! Use /liacalc",
        -1
    )

    sampRegisterChatCommand("liacalc", function()
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
        "OnlyLia Basic Calculator",
        window
    )

    imgui.Text("Basic Calculator Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.InputFloat(
        "Number A",
        numberA
    )

    imgui.InputFloat(
        "Number B",
        numberB
    )

    imgui.Spacing()

    if imgui.Button("Add") then
        result = numberA[0] + numberB[0]
        operation = "Addition"
    end

    imgui.SameLine()

    if imgui.Button("Subtract") then
        result = numberA[0] - numberB[0]
        operation = "Subtraction"
    end

    imgui.Spacing()

    if imgui.Button("Multiply") then
        result = numberA[0] * numberB[0]
        operation = "Multiplication"
    end

    imgui.SameLine()

    if imgui.Button("Divide") then
        if numberB[0] ~= 0 then
            result = numberA[0] / numberB[0]
            operation = "Division"
        else
            operation = "Cannot divide by zero"
        end
    end

    imgui.Spacing()
    imgui.Separator()

    imgui.Text("Operation: " .. operation)
    imgui.Text("Result: " .. string.format("%.2f", result))

    imgui.Spacing()

    if imgui.Button("Send Result") then
        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Calculator Result: " ..
            string.format("%.2f", result),
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
