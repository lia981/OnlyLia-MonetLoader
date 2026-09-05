script_name("OnlyLia Basic Tab UI")
script_author("OnlyLia")
script_description("Basic tab UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Tab UI loaded! Use /liatab",
        -1
    )

    sampRegisterChatCommand("liatab", function()
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
        imgui.ImVec2(450, 300),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Tab UI",
        window
    )

    imgui.Text("Basic Tab Learning")
    imgui.Separator()

    if imgui.BeginTabBar("##tabs") then

        if imgui.BeginTabItem("Home") then

            imgui.Text("Welcome to the Home tab.")
            imgui.Spacing()
            imgui.Text("This is the first tab.")

            imgui.EndTabItem()
        end

        if imgui.BeginTabItem("Information") then

            imgui.Text("OnlyLia Basic Tab UI")
            imgui.Text("Created for MonetLoader learning.")

            imgui.EndTabItem()
        end

        if imgui.BeginTabItem("Settings") then

            imgui.Text("This is a basic settings tab.")

            imgui.Spacing()

            if imgui.Button("Test Button") then
                sampAddChatMessage(
                    "{FF69B4}[OnlyLia] {FFFFFF}Button clicked!",
                    -1
                )
            end

            imgui.EndTabItem()
        end

        imgui.EndTabBar()
    end

    imgui.Spacing()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
