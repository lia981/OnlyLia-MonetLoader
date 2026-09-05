script_name("OnlyLia Basic Timer")
script_author("OnlyLia")
script_description("Basic timer UI learning script")

require "lib.moonloader"

local imgui = require "mimgui"

local window = imgui.new.bool(false)

local running = false
local elapsed = 0.0
local lastTime = os.clock()

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Timer loaded! Use /liatimer",
        -1
    )

    sampRegisterChatCommand("liatimer", function()
        window[0] = not window[0]
    end)

    while true do
        if running then
            local currentTime = os.clock()
            elapsed = elapsed + (currentTime - lastTime)
            lastTime = currentTime
        else
            lastTime = os.clock()
        end

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
        "OnlyLia Basic Timer",
        window
    )

    imgui.Text("Basic Timer Learning")
    imgui.Separator()

    imgui.Spacing()

    local minutes = math.floor(elapsed / 60)
    local seconds = math.floor(elapsed % 60)
    local milliseconds = math.floor(
        (elapsed - math.floor(elapsed)) * 100
    )

    local timerText = string.format(
        "%02d:%02d:%02d",
        minutes,
        seconds,
        milliseconds
    )

    imgui.Text("Timer:")
    imgui.Text(timerText)

    imgui.Spacing()
    imgui.Separator()

    if not running then

        if imgui.Button("Start") then
            running = true
            lastTime = os.clock()
        end

    else

        if imgui.Button("Stop") then
            running = false
        end

    end

    imgui.SameLine()

    if imgui.Button("Reset") then
        running = false
        elapsed = 0.0
        lastTime = os.clock()
    end

    imgui.SameLine()

    if imgui.Button("Close") then
        window[0] = false
    end

    imgui.End()
end)
