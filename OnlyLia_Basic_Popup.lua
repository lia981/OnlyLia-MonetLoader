script_name("OnlyLia Basic Popup")
script_author("OnlyLia")
script_description("Basic popup UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Popup loaded! Use /liapopup",
        -1
    )

    sampRegisterChatCommand("liapopup", function()
        window[0] = true
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
        "OnlyLia Basic Popup",
        window
    )

    imgui.Text("Basic Popup Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Press the button below to open a popup.")

    if imgui.Button("Open Popup") then
        imgui.OpenPopup("OnlyLiaPopup")
    end

    if imgui.BeginPopupModal(
        "OnlyLiaPopup",
        nil,
        imgui.WindowFlags.AlwaysAutoResize
    ) then

        imgui.Text("Hello from OnlyLia Popup!")

        imgui.Spacing()

        imgui.Text(
            "This is a simple popup window."
        )

        imgui.Separator()

        if imgui.Button("Send Message") then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Popup button clicked!",
                -1
            )
        end

        imgui.SameLine()

        if imgui.Button("Close Popup") then
            imgui.CloseCurrentPopup()
        end

        imgui.EndPopup()
    end

    imgui.Spacing()
    imgui.Separator()

    if imgui.Button("Close Window") then
        window[0] = false
    end

    imgui.End()
end)
