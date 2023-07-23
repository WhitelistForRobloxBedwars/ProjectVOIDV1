local Trolled = { Enabled = false }

local function sendTrollMessages(messages)
    for _, message in ipairs(messages) do
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        wait(3)
    end
end

-- Wait until the game is loaded
repeat
    wait()
until game:IsLoaded()

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Sing A Song", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Make By Iamfakemario")

Section:NewButton("Sing You're Been Trolled", function()
    Trolled.Enabled = true
    local messages = {
        "You've been trolled, you've been trolled",
        "Yes, you've probably been told",
        "Don't reply to this guy",
        "He's just trying to get a rise",
        "Out of you, yes, it's true",
        "You respond and that's his cue",
        "To start trouble on the double",
        "While he strokes his manly stubble",
        "You've been trolled, you've been trolled",
        "You should probably just fold",
        "When the only winning move is not to play",
        "And yet you keep on trying, mindlessly replying",
        "You've been trolled, you've been trolled, have a nice day"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)

Section:NewButton("Sing Lyrics You're Been Trolled", function()
    Trolled.Enabled = true
    local messages = {
        "Lyrics=You've been trolled by idk (Really Idk Who)",
        "You've been trolled, you've been trolled",
        "Yes, you've probably been told",
        "Don't reply to this guy",
        "He's just trying to get a rise",
        "Out of you, yes, it's true",
        "You respond and that's his cue",
        "To start trouble on the double",
        "While he strokes his manly stubble",
        "You've been trolled, you've been trolled",
        "You should probably just fold",
        "When the only winning move is not to play",
        "And yet you keep on trying, mindlessly replying",
        "You've been trolled, you've been trolled, have a nice day"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)

Section:NewButton("Sing Never Gonna Give You Up", function()
    Trolled.Enabled = true
    local messages = {
        "We're no strangers to love",
        "You know the rules and so do I",
        "A full commitment's what I'm thinking of",
        "You wouldn't get this from any other guy",
        "I just wanna tell you how I'm feeling",
        "Gotta make you understand",
        "Never gonna give you up",
        "Never gonna let you down",
        "Never gonna run around and desert you",
        "Never gonna make you cry",
        "Never gonna say goodbye",
        "Never gonna tell a lie and hurt you"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)

Section:NewButton("Sing Lyrics Never Gonna Give You Up", function()
    Trolled.Enabled = true
    local messages = {
        "Lyrics=Never Gonna Give U Up By Rick Ashley",
        "We're no strangers to love",
        "You know the rules and so do I",
        "A full commitment's what I'm thinking of",
        "You wouldn't get this from any other guy",
        "I just wanna tell you how I'm feeling",
        "Gotta make you understand",
        "Never gonna give you up",
        "Never gonna let you down",
        "Never gonna run around and desert you",
        "Never gonna make you cry",
        "Never gonna say goodbye",
        "Never gonna tell a lie and hurt you"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)

Section:NewButton("Sing Demon Slayer Op (Never Gonna Give You Up)", function()
    Trolled.Enabled = true
    local messages = {
        "Give you up",
        "Let's you down",
        "Run around and desert you",
        "Make you cry",
        "Tell a lie",
        "Say Goodbye",
        "YEAH",
        "We're no strangers to love",
        "You know the rules and so do I",
        "A full communication of what i thinking of",
        "You won't getting from any other guys",
        "I just wanna tell you",
        "Tell you how I feeling",
        "Gotta make you understand",
        "Don't don't don't don't tell me you're",
        "You're too blind to see",
        "Give you up",
        "Let's you down",
        "Run around and desert you",
        "Make you cry",
        "Tell a lie",
        "Say Goodbye",
        "**Japan Intro**",
        "NEVER GONNA GIVE YOU UP",
        "AND NEVER GOTTA LET'S YOU DOWN",
        "AND RUN AROUND AND DESERT YOU",
        "GONNA MAKE YOU",
        "MAKE YOU UNDERSTAND",
        "**End Japan Intro**",
        "NEVER Gonna",
        "NEVER Gonna GIVE YOU UP",
        "NEVER NEVER GOTTA LET'S YOU DOWN",
        "NEVER GOTTA RUN AROUND AND DESERT YOU",
        "Gonna make you UNDERSTAND!!"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)

Section:NewButton("Sing Lyrics Demon Slayer Op (Never Gonna Give You Up)", function()
    Trolled.Enabled = true
    local messages = {
        "Lyrics=Never Gonna Give U Up Demon Slayer OP By Morgi Memes",
        "Give you up",
        "Let's you down",
        "Run around and desert you",
        "Make you cry",
        "Tell a lie",
        "Say Goodbye",
        "YEAH",
        "We're no strangers to love",
        "You know the rules and so do I",
        "A full communication of what i thinking of",
        "You won't getting from any other guys",
        "I just wanna tell you",
        "Tell you how I feeling",
        "Gotta make you understand",
        "Don't don't don't don't tell me you're",
        "You're too blind to see",
        "Give you up",
        "Let's you down",
        "Run around and desert you",
        "Make you cry",
        "Tell a lie",
        "Say Goodbye",
        "**Japan Intro**",
        "NEVER GONNA GIVE YOU UP",
        "AND NEVER GOTTA LET'S YOU DOWN",
        "AND RUN AROUND AND DESERT YOU",
        "GONNA MAKE YOU",
        "MAKE YOU UNDERSTAND",
        "**End Japan Intro**",
        "NEVER Gonna",
        "NEVER Gonna GIVE YOU UP",
        "NEVER NEVER GOTTA LET'S YOU DOWN",
        "NEVER GOTTA RUN AROUND AND DESERT YOU",
        "Gonna make you UNDERSTAND!!"
    }
    sendTrollMessages(messages)
    Trolled.Enabled = false
end)
