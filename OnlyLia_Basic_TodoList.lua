script_name("OnlyLia Basic To-Do List")
script_author("OnlyLia")
script_description("Basic to-do list UI learning script")

require "lib.moonloader"

local ffi = require "ffi"
local imgui = require "mimgui"

local window = imgui.new.bool(false)
local inputTask = imgui.new.char[128]("")

local tasks = {}

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic To-Do List loaded! Use /liatodo",
        -1
    )

    sampRegisterChatCommand("liatodo", function()
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
        imgui.ImVec2(450, 350),
        imgui.Cond.FirstUseEver
    )

    imgui.Begin(
        "OnlyLia Basic To-Do List",
        window
    )

    imgui.Text("Basic To-Do List Learning")
    imgui.Separator()

    imgui.Spacing()

    imgui.Text("New Task:")

    imgui.InputText(
        "##newtask",
        inputTask,
        128
    )

    imgui.SameLine()

    if imgui.Button("Add") then
        local text = ffi.string(inputTask)

        if text ~= "" then
            table.insert(tasks, {
                text = text,
                done = false
            })

            inputTask = imgui.new.char[128]("")
        end
    end

    imgui.Spacing()
    imgui.Separator()

    imgui.Text("Task List")

    imgui.BeginChild(
        "##tasklist",
        imgui.ImVec2(0, 180),
        true
    )

    for i = #tasks, 1, -1 do

        local task = tasks[i]

        local checked = imgui.new.bool(task.done)

        if imgui.Checkbox(
            task.text .. "##task" .. i,
            checked
        ) then
            task.done = checked[0]
        end

        imgui.SameLine()

        if imgui.SmallButton(
            "Delete##" .. i
        ) then
            table.remove(tasks, i)
        end
    end

    imgui.EndChild()

    imgui.Spacing()

    imgui.Text(
        "Total Tasks: " .. #tasks
    )

    imgui.SameLine()

    if imgui.Button("Clear All") then
        tasks = {}
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
