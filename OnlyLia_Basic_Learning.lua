script_name("OnlyLia Basic Learning")
script_author("OnlyLia")
script_description("Basic MonetLoader learning script")

require "lib.moonloader"

function main()
    repeat
        wait(0)
    until isSampAvailable()

    sampAddChatMessage(
        "{FF69B4}[OnlyLia] {FFFFFF}Basic Learning Script berhasil dimuat!",
        -1
    )

    sampRegisterChatCommand("liahello", function()
        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}Halo! Kamu berhasil menggunakan command.",
            -1
        )
    end)

    sampRegisterChatCommand("liainfo", function()
        sampAddChatMessage(
            "{FF69B4}[OnlyLia] {FFFFFF}MonetLoader Basic Learning Script",
            -1
        )
        sampAddChatMessage(
            "{FFFFFF}Author: {FF69B4}OnlyLia",
            -1
        )
    end)

    while true do
        wait(0)
    end
end