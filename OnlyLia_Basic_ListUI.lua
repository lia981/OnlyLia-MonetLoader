script_name("OnlyLia Basic List UI")
script_author("OnlyLia")
script_description("Basic list UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local selectedItem = imgui.new.int(-1)

local items = {
    "Learning Lua",
    "Learning MonetLoader",
    "Learning mimgui",
    "Creating UI",
    "Building Scripts"
}

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic List UI loaded! Use /lialist",
        -1
    )

    sampRegisterChatCommand("lialist", function()
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
        imgui.ImVec2(420, 320),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic List UI",
        window
    )

    imgui.Text("Basic List Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Select an item:")

    for i = 1, #items do
        local isSelected = selectedItem[0] == i - 1

        if imgui.Selectable(
            items[i],
            isSelected
        ) then
            selectedItem[0] = i - 1
        end
    end

    imgui.Spacing()
    imgui.Separator()

    if selectedItem[0] >= 0 then
        imgui.Text(
            "Selected: " ..
            items[selectedItem[0] + 1]
        )
    else
        imgui.Text("Selected: None")
    end

    imgui.Spacing()

    if imgui.Button("Send Selection") then
        if selectedItem[0] >= 0 then
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Selected: " ..
                items[selectedItem[0] + 1],
                -1
            )
        else
            sampAddChatMessage(
                "{FF69B4}[OnlyLia] {FFFFFF}Please select an item first.",
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
