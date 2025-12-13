-- QuestChecker Addon com Localização
-- Comando: /qc ou /questcheck

local addonName, addon = ...
local L = {}

-- Tabela GLOBAL de cores (será usada por todos os locales)
G_QuestCheckerColors = {
    GREEN = "|cFF00FF00",
    RED = "|cFFFF0000",
    YELLOW = "|cFFFFFF00",
    BLUE = "|cFF0070DD",
    ORANGE = "|cFFFF8000",
    PURPLE = "|cFFA335EE",
    GRAY = "|cFF808080",
    WHITE = "|cFFFFFFFF",
}

-- Configurações padrão
local DEFAULT_QUEST_LIST = {
    85460, 
    82706, 
    91173, 
    82679, 
    82449
}

-- Banco de dados do addon
QuestCheckerDB = QuestCheckerDB or {
    questList = {},
    showQuestDetails = true,
    chatOutput = true,
    locale = GetLocale(), -- Idioma padrão do cliente
}

-- Inicialização do addon
local function InitializeAddon()
    -- Carrega localização
    addon:LoadLocale()
    
    -- Se a lista estiver vazia, usar a padrão
    if #QuestCheckerDB.questList == 0 then
        QuestCheckerDB.questList = DEFAULT_QUEST_LIST
    end
    
    -- Atualiza locale se necessário
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
end

-- Carrega o locale apropriado
function addon:LoadLocale()
    local locale = QuestCheckerDB.locale or GetLocale()
    
    -- Fallback para enUS se o locale não existir
    if not QuestCheckerLocale[locale] then
        locale = "enUS"
        QuestCheckerDB.locale = locale
    end
    
    L = QuestCheckerLocale[locale]

    -- Processa TODAS as strings para substituir placeholders de cor
    for key, value in pairs(L) do
        if type(value) == "string" then
            -- Substitui {GREEN}, {RED}, etc., pelos valores reais das cores
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
    
    -- Garante que todas as chaves existam (fallback para enUS)
    for key, value in pairs(QuestCheckerLocale["enUS"]) do
        if not L[key] then
            L[key] = value
        end
    end
end

-- Muda o idioma do addon
local function SetLocale(newLocale)
    if QuestCheckerLocale[newLocale] then
        QuestCheckerDB.locale = newLocale
        addon:LoadLocale()
        print(string.format(L.LOCALE_CHANGED, newLocale))
    else
        print(string.format(L.LOCALE_NOT_AVAILABLE, newLocale))
    end
end

-- Verifica se uma quest está completa
local function IsQuestCompleted(questID)
    if C_QuestLog then
        return C_QuestLog.IsQuestFlaggedCompleted(questID)
    else
        -- Fallback para versões mais antigas
        return IsQuestFlaggedCompleted(questID)
    end
end

-- Obtém o nome da quest
local function GetQuestName(questID)
    local questName = C_QuestLog.GetTitleForQuestID(questID)
    return questName or string.format(L.QUEST_UNKNOWN, questID)
end

-- Mostra o status de uma quest específica
local function ShowQuestStatus(questID)
    local questName = GetQuestName(questID)
    local isCompleted = IsQuestCompleted(questID)
    
    local statusText, color
    
    if isCompleted then
        statusText = L.STATUS_COMPLETE
        color = L.COLOR_GREEN
    else
        statusText = L.STATUS_INCOMPLETE
        color = L.COLOR_RED
    end
    
    -- Formata a mensagem
    local message
    if QuestCheckerDB.showQuestDetails then
        message = string.format(L.QUEST_STATUS_DETAILED, questName, questID, color, statusText)
    else
        message = string.format(L.QUEST_STATUS_SIMPLE, questName, color, statusText)
    end
    
    -- Mostra no chat
    if QuestCheckerDB.chatOutput then
        print(message)
    end
    
    return message
end

-- Verifica todas as quests na lista
local function CheckAllQuests()
    print(L.CHECK_HEADER)
    
    if #QuestCheckerDB.questList == 0 then
        print(L.NO_QUESTS_IN_LIST)
        return
    end
    
    local completedCount = 0
    local totalCount = 0
    
    for _, questID in ipairs(QuestCheckerDB.questList) do
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
end

-- Adiciona uma quest à lista
local function AddQuest(questID)
    questID = tonumber(questID)
    
    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end
    
    -- Verifica se já existe
    for _, existingID in ipairs(QuestCheckerDB.questList) do
        if existingID == questID then
            print(string.format(L.QUEST_ALREADY_IN_LIST, questID))
            return
        end
    end
    
    -- Adiciona à lista
    table.insert(QuestCheckerDB.questList, questID)
    print(string.format(L.QUEST_ADDED, questID))
    
    -- Mostra o status imediatamente
    ShowQuestStatus(questID)
end

-- Remove uma quest da lista
local function RemoveQuest(questID)
    questID = tonumber(questID)
    
    if not questID then
        print(L.ERROR_INVALID_QUEST_ID)
        return
    end
    
    -- Procura e remove
    for i, existingID in ipairs(QuestCheckerDB.questList) do
        if existingID == questID then
            table.remove(QuestCheckerDB.questList, i)
            print(string.format(L.QUEST_REMOVED, questID))
            return
        end
    end
    
    print(string.format(L.QUEST_NOT_FOUND, questID))
end

-- Lista todas as quests
local function ListQuests()
    if #QuestCheckerDB.questList == 0 then
        print(L.NO_QUESTS_IN_LIST)
        return
    end
    
    print(L.LIST_HEADER)
    for _, questID in ipairs(QuestCheckerDB.questList) do
        local questName = GetQuestName(questID)
        local status = IsQuestCompleted(questID) and L.STATUS_COMPLETE_COLORED or L.STATUS_INCOMPLETE_COLORED
        print(string.format(L.QUEST_LIST_FORMAT, questID, questName, status))
    end
end

-- Interface de configuração
local function ShowConfig()
    print(L.CONFIG_HEADER)
    print(string.format(L.CONFIG_DETAILS, QuestCheckerDB.showQuestDetails and L.STATUS_ENABLED or L.STATUS_DISABLED))
    print(string.format(L.CONFIG_CHAT, QuestCheckerDB.chatOutput and L.STATUS_ENABLED or L.STATUS_DISABLED))
    print(string.format(L.CONFIG_QUESTS_COUNT, #QuestCheckerDB.questList))
    print(string.format(L.CONFIG_LOCALE, QuestCheckerDB.locale))
    
    -- Mostra locales disponíveis
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

-- Manipula comandos de configuração
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
        local locale = command:sub(8):upper()
        SetLocale(locale)
    else
        ShowConfig()
    end
end

-- Limpa toda a lista de quests
local function ClearQuestList()
    QuestCheckerDB.questList = {}
    print(L.QUEST_LIST_CLEARED)
end

-- Handler principal de comandos
local function HandleCommand(input)
    local args = {}
    
    -- Divide os argumentos
    for arg in input:gmatch("%S+") do
        table.insert(args, arg)
    end
    
    local command = args[1] and args[1]:lower() or ""
    
    if command == "" or command == "check" then
        CheckAllQuests()
    elseif command == "add" and args[2] then
        AddQuest(args[2])
    elseif command == "remove" and args[2] then
        RemoveQuest(args[2])
    elseif command == "list" then
        ListQuests()
    elseif command == "clear" then
        ClearQuestList()
    elseif command == "config" then
        if args[2] then
            HandleConfigCommand(table.concat(args, " ", 2))
        else
            ShowConfig()
        end
    elseif command == "locale" and args[2] then
        SetLocale(args[2]:upper())
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
    else
        -- Se for um número, verifica apenas essa quest
        local questID = tonumber(command)
        if questID then
            ShowQuestStatus(questID)
        else
            print(L.ERROR_UNKNOWN_COMMAND)
        end
    end
end

-- Registra os comandos no chat
SLASH_QUESTCHECKER1 = "/questcheck"
SLASH_QUESTCHECKER2 = "/qc"
SlashCmdList["QUESTCHECKER"] = HandleCommand

-- Eventos
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "QuestChecker" then
        InitializeAddon()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Função global para uso por outros addons
_G.QuestChecker = {
    CheckQuest = ShowQuestStatus,
    AddQuest = AddQuest,
    RemoveQuest = RemoveQuest,
    GetQuestList = function() return QuestCheckerDB.questList end,
    IsQuestCompleted = IsQuestCompleted,
    GetLocaleData = function() return L end,
    SetLocale = SetLocale
}