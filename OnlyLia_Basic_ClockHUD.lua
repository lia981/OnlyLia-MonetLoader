script_name("OnlyLia Basic Clock HUD")
script_author("OnlyLia")
script_description("Basic Clock HUD learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local showHud = imgui.new.bool(true)

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Clock HUD loaded! Use /liahud",
        -1
    )

    sampRegisterChatCommand("liahud", function()
        showHud[0] = not showHud[0]

        if showHud[0] then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Clock HUD enabled.",
                -1
            )
        else
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Clock HUD disabled.",
                -1
            )
        end
    end)

    while true do
        wait(0)
    end
end

imgui.OnDrawFrame(function()
    return showHud[0]
end, function()

    local time = os.date("%H:%M:%S")

    imgui.SetNextWindowPos(
        imgui.ImVec2(20, 20),
        imgui.Cond.FirstUseEver
    )

    imgui.SetNextWindowBgAlpha(0.70)

    imgui.Begin(
        "OnlyLia Clock HUD",
        nil,
        imgui.WindowFlags.NoTitleBar +
        imgui.WindowFlags.AlwaysAutoResize +
        imgui.WindowFlags.NoResize
    )

    imgui.Text("TIME")
    imgui.Separator()
    imgui.Text(time)

    imgui.End()
end)
