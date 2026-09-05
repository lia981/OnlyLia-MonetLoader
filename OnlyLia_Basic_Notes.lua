script_name("OnlyLia Basic Notes")
script_author("OnlyLia")
script_description("Basic notes UI learning script")

require "lib.moonloader"

local ffi = require "ffi"
local imgui = require "mimgui"

local window = imgui.new.bool(false)
local note = imgui.new.char[1024]("")
local savedNote = ""

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Notes loaded! Use /lianotes",
        -1
    )

    sampRegisterChatCommand("lianotes", function()
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
        imgui.ImVec2(500, 400),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic Notes",
        window
    )

    imgui.Text("Basic Notes Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("Write your note:")

    imgui.InputTextMultiline(
        "##note",
        note,
        1024,
        imgui.ImVec2(-1, 200)
    )

    imgui.Spacing()

    if imgui.Button("Save Note") then
        savedNote = ffi.string(note)

        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Note saved!",
            -1
        )
    end

    imgui.SameLine()

    if imgui.Button("Clear") then
        ffi.fill(note, 1024)
        savedNote = ""
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.Spacing()
    imgui.Separator()

    if savedNote ~= "" then
        imgui.Text("Status: Note saved in memory")
    else
        imgui.Text("Status: No saved note")
    end

    imgui.End()
end)
