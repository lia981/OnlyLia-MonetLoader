script_name("OnlyLia Basic Combo Box")
script_author("OnlyLia")
script_description("Basic combo box UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)
local selectedItem = imgui.new.int(0)

local items = {
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4"
}

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Combo Box loaded! Use /liacombo",
        -1
    )

    sampRegisterChatCommand("liacombo", function()
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
        "OnlyLia Basic Combo Box",
        window
    )

    imgui.Text("Basic Combo Box Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Choose an option:")

    if imgui.BeginCombo(
        "##combo",
        items[selectedItem[0] + 1]
    ) then

        for i = 1, #items do

            local isSelected =
                selectedItem[0] == i - 1

            if imgui.Selectable(
                items[i],
                isSelected
            ) then

                selectedItem[0] = i - 1
            end

            if isSelected then
                imgui.SetItemDefaultFocus()
            end
        end

        imgui.EndCombo()
    end

    imgui.Spacing()

    imgui.Text(
        "Selected: " ..
        items[selectedItem[0] + 1]
    )

    imgui.Spacing()
    imgui.Separator()

    if imgui.Button("Send Selection") then

        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Selected: " ..
            items[selectedItem[0] + 1],
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
