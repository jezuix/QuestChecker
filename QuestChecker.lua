-- QuestChecker Addon
-- Command: /qc or /questcheck

local addonName, addon = ...
local L = {}

-- GLOBAL color table (will be used by all locales)
G_QuestCheckerColors = {
    GREEN = "|cFF00FF00",
    RED = "|cFFFF0000",
    YELLOW = "|cFFFFFF00",
    BLUE = "|cFF0070DD",
    ORANGE = "|cFFFF9900",
    PURPLE = "|cFFA335EE",
    GRAY = "|cFF808080",
    WHITE = "|cFFFFFFFF",
}

-- Default settings
local DEFAULT_QUEST_LIST = {
    85460,
    82706,
    91173,
    82679,
    82449
}

-- Get current character key
local function GetCharacterKey()
    local name, realm = UnitFullName("player")

    if not realm or realm == "" then
        realm = GetRealmName()
    end
    return name .. "-" .. realm
end

-- Addon database
QuestCheckerDB = QuestCheckerDB or {
    -- Global quests (shared across all characters)
    globalQuestList = {},

    -- Character-specific quests
    characterQuests = {},

    -- Settings
    showQuestDetails = true,
    chatOutput = true,
    locale = GetLocale() -- Client default language
}

-- Initialize character quests table if needed
local function InitCharacterQuests()
    local charKey = GetCharacterKey()

    if QuestCheckerDB.characterQuests then
        for k, v in pairs(QuestCheckerDB.characterQuests) do
            if (k == charKey) then
                return
            end
        end
    else
        QuestCheckerDB.characterQuests = {}
    end

    QuestCheckerDB.characterQuests[charKey] = {}
end

-- Initialize global quests table if needed
local function InitGlobalQuests()
    if not QuestCheckerDB.globalQuestList then
        QuestCheckerDB.globalQuestList = {}
    end
end

-- Addon initialization
local function InitializeAddon()
    -- Initialize character quests
    InitCharacterQuests()

    -- Initialize global quests
    InitGlobalQuests()

    -- Load localization
    addon:LoadLocale()

    -- If global list is empty, use default
    if #QuestCheckerDB.globalQuestList == 0 then
        QuestCheckerDB.globalQuestList = DEFAULT_QUEST_LIST
    end

    -- Update locale if needed
    if not QuestCheckerDB.locale then
        QuestCheckerDB.locale = GetLocale()
    end

    print(L.ADDON_LOADED)
    print(L.COMMANDS_AVAILABLE_HEADER)
    print(L.COMMAND_CHECK)
    print(L.COMMAND_ADD)
    print(L.COMMAND_REMOVE)
    print(L.COMMAND_LIST)
    print(L.COMMAND_CONFIG)
    print(L.COMMAND_GLOBAL_ADD)
    print(L.COMMAND_GLOBAL_REMOVE)
    print(L.COMMAND_CHAR_LIST)
    print(L.COMMAND_GLOBAL_LIST)
end

-- Load appropriate locale
function addon:LoadLocale()
    local locale = QuestCheckerDB.locale or GetLocale()

    -- Fallback to enUS if locale doesn't exist
    if not QuestCheckerLocale[locale] then
        locale = "enUS"
        QuestCheckerDB.locale = locale
    end

    L = QuestCheckerLocale[locale]

    -- Ensure all keys exist (fallback to enUS)
    for key, value in pairs(QuestCheckerLocale["enUS"]) do
        if not L[key] then
            L[key] = value
        end
    end

    -- Process ALL strings to replace color placeholders
    for key, value in pairs(L) do
        if type(value) == "string" then
            -- Replace color tag with actual color values
            L[key] = value:gsub("{GREEN}", G_QuestCheckerColors.GREEN)
                :gsub("{RED}", G_QuestCheckerColors.RED)
                :gsub("{YELLOW}", G_QuestCheckerColors.YELLOW)
                :gsub("{BLUE}", G_QuestCheckerColors.BLUE)
                :gsub("{ORANGE}", G_QuestCheckerColors.ORANGE)
                :gsub("{PURPLE}", G_QuestCheckerColors.PURPLE)
                :gsub("{GRAY}", G_QuestCheckerColors.GRAY)
                :gsub("{WHITE}", G_QuestCheckerColors.WHITE)
        end
    end
end

-- Change addon language
local function SetLocale(newLocale)
    newLocale = normalizeLocale(newLocale)

    if QuestCheckerLocale and QuestCheckerLocale[newLocale] then
        QuestCheckerDB.locale = newLocale
        addon:LoadLocale()
        print(string.format(L.LOCALE_CHANGED, newLocale))
    else
        print(string.format(L.LOCALE_NOT_AVAILABLE, newLocale))
    end
end

function normalizeLocale(locale)
    if (locale) then
        locale = string.lower(locale)

        if #locale < 2 then
            return string.upper(locale)
        end

        local beginStr = string.sub(locale, 1, -3)
        local endStr = string.sub(locale, -2)

        return beginStr .. string.upper(endStr)
    else
        return locale
    end
end

-- Check if a quest is complete
local function IsQuestCompleted(questID)
    if C_QuestLog then
        return C_QuestLog.IsQuestFlaggedCompleted(questID)
    else
        -- Fallback for older versions
        return IsQuestFlaggedCompleted(questID)
    end
end

-- Get quest name
local function GetQuestName(questID)
    local questName = C_QuestLog.GetTitleForQuestID(questID)
    return questName or string.format(L.QUEST_UNKNOWN, questID)
end

-- Show status of a specific quest
local function ShowQuestStatus(questID)
    local questName = GetQuestName(questID)
    local isCompleted = IsQuestCompleted(questID)

    local statusText, color

    if isCompleted then
        statusText = L.STATUS_COMPLETE
        color = G_QuestCheckerColors.GREEN
    else
        statusText = L.STATUS_INCOMPLETE
        color = G_QuestCheckerColors.RED
    end

    -- Format message
    local message
    if QuestCheckerDB.showQuestDetails then
        message = string.format(L.QUEST_STATUS_DETAILED, questName, questID, color, statusText)
    else
        message = string.format(L.QUEST_STATUS_SIMPLE, questName, color, statusText)
    end

    -- Show in chat
    if QuestCheckerDB.chatOutput then
        print(message)
    end

    return message
end

-- Get current character's quest list
local function GetCharacterQuestList()
    local charKey = GetCharacterKey()
    InitCharacterQuests()
    return QuestCheckerDB.characterQuests[charKey] or {}
end

-- Check all quests in specified list
local function CheckQuests(questList, listName)
    if #questList == 0 then
        print(string.format(L.NO_QUESTS_IN_NAMED_LIST, listName))
        return 0, 0
    end

    print(string.format(L.CHECK_NAMED_HEADER, listName))

    local completedCount = 0
    local totalCount = 0

    for _, questID in ipairs(questList) do
        local questName = GetQuestName(questID)
        local isCompleted = IsQuestCompleted(questID)

        if isCompleted then
            completedCount = completedCount + 1
            print(string.format(L.QUEST_COMPLETE_FORMAT, questName, questID))
        else
            print(string.format(L.QUEST_INCOMPLETE_FORMAT, questName, questID))
        end

        totalCount = totalCount + 1
    end

    print(string.format(L.PROGRESS_FORMAT, completedCount, totalCount))
    return completedCount, totalCount
end

-- Check all quests (both character and global)
local function CheckAllQuests()
    local charQuests = GetCharacterQuestList()
    local globalQuests = QuestCheckerDB.globalQuestList

    local charCompleted, charTotal = CheckQuests(charQuests, L.CHARACTER_QUESTS)
    print("") -- Empty line for separation
    local globalCompleted, globalTotal = CheckQuests(globalQuests, L.GLOBAL_QUESTS)

    print("\n" .. L.TOTAL_SUMMARY)
    print(string.format(L.CHARACTER_PROGRESS, charCompleted, charTotal))
    print(string.format(L.GLOBAL_PROGRESS, globalCompleted, globalTotal))
end

-- Add a quest to character list
local function AddCharacterQuest(questID)
    questID = tonumber(questID)

    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end

    local charKey = GetCharacterKey()
    InitCharacterQuests()
    local charQuests = QuestCheckerDB.characterQuests[charKey]

    -- Check if already exists
    for _, existingID in ipairs(charQuests) do
        if existingID == questID then
            print(string.format(L.QUEST_ALREADY_IN_CHAR_LIST, questID))
            return
        end
    end

    -- Add to character list
    table.insert(charQuests, questID)
    print(string.format(L.QUEST_ADDED_CHARACTER, questID, GetQuestName(questID)))

    -- Show status immediately
    ShowQuestStatus(questID)
end

-- Add a quest to global list
local function AddGlobalQuest(questID)
    questID = tonumber(questID)

    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end

    -- Check if already exists
    for _, existingID in ipairs(QuestCheckerDB.globalQuestList) do
        if existingID == questID then
            print(string.format(L.QUEST_ALREADY_IN_GLOBAL_LIST, questID))
            return
        end
    end

    -- Add to global list
    table.insert(QuestCheckerDB.globalQuestList, questID)
    print(string.format(L.QUEST_ADDED_GLOBAL, questID))

    -- Show status immediately
    ShowQuestStatus(questID)
end

-- Remove a quest from character list
local function RemoveCharacterQuest(questID)
    questID = tonumber(questID)

    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end

    local charKey = GetCharacterKey()
    InitCharacterQuests()
    local charQuests = QuestCheckerDB.characterQuests[charKey]

    -- Search and remove
    for i, existingID in ipairs(charQuests) do
        if existingID == questID then
            table.remove(charQuests, i)
            print(string.format(L.QUEST_REMOVED_CHARACTER, questID))
            return
        end
    end

    print(string.format(L.QUEST_NOT_FOUND_CHARACTER, questID))
end

-- Remove a quest from global list
local function RemoveGlobalQuest(questID)
    questID = tonumber(questID)

    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end

    -- Search and remove
    for i, existingID in ipairs(QuestCheckerDB.globalQuestList) do
        if existingID == questID then
            table.remove(QuestCheckerDB.globalQuestList, i)
            print(string.format(L.QUEST_REMOVED_GLOBAL, questID))
            return
        end
    end

    print(string.format(L.QUEST_NOT_FOUND_GLOBAL, questID))
end

-- List character quests
local function ListCharacterQuests()
    local charKey = GetCharacterKey()
    InitCharacterQuests()
    local charQuests = QuestCheckerDB.characterQuests[charKey]

    if #charQuests == 0 then
        print(L.NO_CHARACTER_QUESTS)
        return
    end

    print(string.format(L.LIST_CHARACTER_HEADER, charKey))
    for _, questID in ipairs(charQuests) do
        local questName = GetQuestName(questID)
        local status = IsQuestCompleted(questID) and L.STATUS_COMPLETE_COLORED or L.STATUS_INCOMPLETE_COLORED
        print(string.format(L.QUEST_LIST_FORMAT, questID, questName, status))
    end
    print(string.format(L.TOTAL_QUESTS_COUNT, #charQuests))
end

-- List global quests
local function ListGlobalQuests()
    if #QuestCheckerDB.globalQuestList == 0 then
        print(L.NO_GLOBAL_QUESTS)
        return
    end

    print(L.LIST_GLOBAL_HEADER)
    for _, questID in ipairs(QuestCheckerDB.globalQuestList) do
        local questName = GetQuestName(questID)
        local status = IsQuestCompleted(questID) and L.STATUS_COMPLETE_COLORED or L.STATUS_INCOMPLETE_COLORED
        print(string.format(L.QUEST_LIST_FORMAT, questID, questName, status))
    end
    print(string.format(L.TOTAL_QUESTS_COUNT, #QuestCheckerDB.globalQuestList))
end

-- List all quests (both character and global)
local function ListAllQuests()
    ListCharacterQuests()
    print("") -- Empty line for separation
    ListGlobalQuests()
end

-- Interface de configuração
local function ShowConfig()
    local charKey = GetCharacterKey()
    InitCharacterQuests()
    local charQuests = QuestCheckerDB.characterQuests[charKey]

    print(L.CONFIG_HEADER)
    print(string.format(L.CONFIG_DETAILS, QuestCheckerDB.showQuestDetails and L.STATUS_ENABLED or L.STATUS_DISABLED))
    print(string.format(L.CONFIG_CHAT, QuestCheckerDB.chatOutput and L.STATUS_ENABLED or L.STATUS_DISABLED))
    print(string.format(L.CONFIG_CHAR_QUESTS_COUNT, #charQuests))
    print(string.format(L.CONFIG_GLOBAL_QUESTS_COUNT, #QuestCheckerDB.globalQuestList))
    print(string.format(L.CONFIG_LOCALE, QuestCheckerDB.locale))

    -- Show available locales
    print(L.CONFIG_AVAILABLE_LOCALES)
    for localeCode, localeData in pairs(QuestCheckerLocale) do
        if localeData.LOCALE_NAME then
            print(string.format("  |cFFFFFF00%s|r - %s", localeCode, localeData.LOCALE_NAME))
        end
    end

    print(L.CONFIG_COMMANDS_HEADER)
    print(L.CONFIG_DETAILS_CMD)
    print(L.CONFIG_CHAT_CMD)
    print(L.CONFIG_LOCALE_CMD)
end

-- Handle configuration commands
local function HandleConfigCommand(args)
    local command = args and args:lower()

    if command == "details on" then
        QuestCheckerDB.showQuestDetails = true
        print(L.CONFIG_DETAILS_ENABLED)
    elseif command == "details off" then
        QuestCheckerDB.showQuestDetails = false
        print(L.CONFIG_DETAILS_DISABLED)
    elseif command == "chat on" then
        QuestCheckerDB.chatOutput = true
        print(L.CONFIG_CHAT_ENABLED)
    elseif command == "chat off" then
        QuestCheckerDB.chatOutput = false
        print(L.CONFIG_CHAT_DISABLED)
    elseif command:sub(1, 7) == "locale " then
        local locale = command:sub(8)
        SetLocale(locale)
    else
        ShowConfig()
    end
end

-- Clear character quest list
local function ClearCharacterQuestList()
    local charKey = GetCharacterKey()
    InitCharacterQuests()
    QuestCheckerDB.characterQuests[charKey] = {}
    print(L.CHARACTER_QUEST_LIST_CLEARED)
end

-- Clear global quest list
local function ClearGlobalQuestList()
    QuestCheckerDB.globalQuestList = {}
    print(L.GLOBAL_QUEST_LIST_CLEARED)
end

-- Main command handler
local function HandleCommand(input)
    local args = {}

    -- Split arguments
    for arg in input:gmatch("%S+") do
        table.insert(args, arg)
    end

    local command = args[1] and args[1]:lower() or ""
    local subcommand = args[2] and args[2]:lower() or ""
    local questID = args[3] or args[2] -- Handle cases where subcommand might be the questID

    if command == "" or command == "check" then
        CheckAllQuests()
    elseif command == "add" then
        if subcommand == "global" and args[3] then
            AddGlobalQuest(args[3])
        elseif subcommand and tonumber(subcommand) then
            AddCharacterQuest(subcommand)
        else
            print(L.ERROR_INVALID_SYNTAX .. " " .. L.INSTRUCTION_ADD_QUEST)
        end
    elseif command == "remove" then
        if subcommand == "global" and args[3] then
            RemoveGlobalQuest(args[3])
        elseif subcommand and tonumber(subcommand) then
            RemoveCharacterQuest(subcommand)
        else
            print(L.ERROR_INVALID_SYNTAX .. " " .. L.INSTRUCTION_REMOVE_QUEST)
        end
    elseif command == "list" then
        if subcommand == "char" or subcommand == "character" then
            ListCharacterQuests()
        elseif subcommand == "global" then
            ListGlobalQuests()
        else
            ListAllQuests()
        end
    elseif command == "clear" then
        if subcommand == "char" or subcommand == "character" then
            ClearCharacterQuestList()
        elseif subcommand == "global" then
            ClearGlobalQuestList()
        else
            print(L.ERROR_INVALID_SYNTAX .. " " .. L.INSTRUCTION_CLEAR_QUEST)
        end
    elseif command == "config" then
        if args[2] then
            HandleConfigCommand(table.concat(args, " ", 2))
        else
            ShowConfig()
        end
    elseif command == "locale" and args[2] then
        SetLocale(args[2])
    elseif command == "help" then
        print(L.HELP_HEADER)
        print(L.HELP_CHECK)
        print(L.HELP_ADD)
        print(L.HELP_REMOVE)
        print(L.HELP_LIST)
        print(L.HELP_CLEAR)
        print(L.HELP_CONFIG)
        print(L.HELP_LOCALE)
        print(L.HELP_HELP)
        print(L.HELP_GLOBAL_ADD)
        print(L.HELP_GLOBAL_REMOVE)
        print(L.HELP_CHAR_LIST)
        print(L.HELP_GLOBAL_LIST)
    else
        -- If it's a number, check only that quest
        questID = tonumber(questID)
        if questID then
            ShowQuestStatus(questID)
        else
            print(L.ERROR_UNKNOWN_COMMAND)
        end
    end
end

-- Register chat commands
SLASH_QUESTCHECKER1 = "/questcheck"
SLASH_QUESTCHECKER2 = "/qc"
SlashCmdList["QUESTCHECKER"] = HandleCommand

-- Events
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "QuestChecker" then
        InitializeAddon()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Global function for use by other addons
_G.QuestChecker = {
    CheckQuest = ShowQuestStatus,
    AddCharacterQuest = AddCharacterQuest,
    AddGlobalQuest = AddGlobalQuest,
    RemoveCharacterQuest = RemoveCharacterQuest,
    RemoveGlobalQuest = RemoveGlobalQuest,
    GetCharacterQuestList = GetCharacterQuestList,
    GetGlobalQuestList = function() return QuestCheckerDB.globalQuestList end,
    IsQuestCompleted = IsQuestCompleted,
    GetLocaleData = function() return L end,
    SetLocale = SetLocale
}
