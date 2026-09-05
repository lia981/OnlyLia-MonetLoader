script_name("OnlyLia Basic Notification")
script_author("OnlyLia")
script_description("Basic notification system learning script")

require "lib.moonloader"

function notify(message)
    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}" .. message,
        -1
    )
end

function main()
    repeat
        wait(0)
    until isSampAvailable()

    notify("Notification System loaded! Use /lianotify")

    sampRegisterChatCommand("lianotify", function()
        notify("This is a basic notification!")
    end)

    sampRegisterChatCommand("liatest", function()
        notify("Test notification successful!")
    end)

    while true do
        wait(0)
    end
end
