script_name("OnlyLia Basic Auto Save")
script_author("OnlyLia")
script_description("Basic save and load settings learning script")

require "lib.moonloader"

local imgui = require "mimgui"
local inicfg = require "inicfg"

local window = imgui.new.bool(false)
local enableFeature = imgui.new.bool(false)
local value = imgui.new.int(50)

local configPath = getWorkingDirectory() .. "/OnlyLia_Basic_AutoSave.ini"

local config = inicfg.load({
    settings = {
        enableFeature = false,
        value = 50
    }
}, configPath)

enableFeature[0] = config.settings.enableFeature
value[0] = config.settings.value

local function saveSettings()
    config.settings.enableFeature = enableFeature[0]
    config.settings.value = value[0]

    inicfg.save(config, configPath)
end

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Auto Save loaded! Use /liasave",
        -1
    )

    sampRegisterChatCommand("liasave", function()
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
        imgui.ImVec2(420, 260),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Auto Save",
        window
    )

    imgui.Text("Basic Save & Load Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Checkbox(
        "Enable Feature",
        enableFeature
    )

    imgui.SliderInt(
        "Value",
        value,
        0,
        100
    )

    imgui.Spacing()

    imgui.Text(
        "Current Value: " .. value[0]
    )

    imgui.Spacing()
    imgui.Separator()

    if imgui.Button("Save Settings") then
        saveSettings()

        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Settings saved!",
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
