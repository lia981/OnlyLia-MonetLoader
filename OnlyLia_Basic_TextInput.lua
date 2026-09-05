script_name("OnlyLia Basic Text Input")
script_author("OnlyLia")
script_description("Basic text input learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local inputText = imgui.new.char[128]("")
local resultText = ""

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Text Input loaded! Use /liainput",
        -1
    )

    sampRegisterChatCommand("liainput", function()
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
        imgui.ImVec2(420, 220),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Text Input",
        window
    )

    imgui.Text("Basic Text Input Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Enter Text:")

    imgui.InputText(
        "##input",
        inputText,
        128
    )

    imgui.Spacing()

    if imgui.Button("Submit") then
        resultText = ffi.string(inputText)
    end

    imgui.SameLine()

    if imgui.Button("Send to Chat") then
        local text = ffi.string(inputText)

        if text ~= "" then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}" .. text,
                -1
            )
        end
    end

    imgui.Spacing()
    imgui.Separator()

    if resultText ~= "" then
        imgui.Text("Result: " .. resultText)
    end

    imgui.Spacing()

    if imgui.Button("Clear") then
        inputText = imgui.new.char[128]("")
        resultText = ""
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
