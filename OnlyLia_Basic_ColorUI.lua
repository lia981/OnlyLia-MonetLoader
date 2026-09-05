script_name("OnlyLia Basic Color UI")
script_author("OnlyLia")
script_description("Basic color UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

local color = imgui.new.float[4](1.0, 0.4, 0.7, 1.0)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Color UI loaded! Use /liacolor",
        -1
    )

    sampRegisterChatCommand("liacolor", function()
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
        imgui.ImVec2(420, 280),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Color UI",
        window
    )

    imgui.Text("Basic Color Picker Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Choose a color:")

    imgui.ColorEdit4(
        "##color",
        color
    )

    imgui.Spacing()

    imgui.Text("Red: " .. math.floor(color[0] * 255))
    imgui.Text("Green: " .. math.floor(color[1] * 255))
    imgui.Text("Blue: " .. math.floor(color[2] * 255))

    imgui.Spacing()
    imgui.Separator()

    imgui.TextColored(
        imgui.ImVec4(
            color[0],
            color[1],
            color[2],
            color[3]
        ),
        "This text uses your selected color!"
    )

    imgui.Spacing()

    if imgui.Button("Reset Color") then
        color[0] = 1.0
        color[1] = 0.4
        color[2] = 0.7
        color[3] = 1.0
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
