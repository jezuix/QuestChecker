QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["enUS"] = {
    -- Informações do locale
    LOCALE_NAME = "English (US)",
    
    -- Mensagens de inicialização
    ADDON_LOADED = "{GREEN}QuestChecker|r loaded. Type {YELLOW}/qc|r or {YELLOW}/questcheck|r to use.",
    COMMANDS_AVAILABLE_HEADER = "Available commands:",
    
    -- Comandos principais
    COMMAND_CHECK = "{YELLOW}/qc|r - Check all quests in the list",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Add a quest to the list",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove a quest from the list",
    COMMAND_LIST = "{YELLOW}/qc list|r - Show all quests in the list",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Open settings",
    
    -- Status das quests
    STATUS_COMPLETE = "COMPLETE",
    STATUS_INCOMPLETE = "INCOMPLETE",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETE|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETE|r",
    
    -- Formatação de mensagens
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETE|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETE|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",
    
    -- Cabeçalhos
    CHECK_HEADER = "{GREEN}=== Quest Check ===",
    LIST_HEADER = "{GREEN}=== Quest List ===",
    CONFIG_HEADER = "{GREEN}=== QuestChecker Settings ===",
    HELP_HEADER = "{GREEN}=== QuestChecker Help ===",
    
    -- Mensagens de progresso
    PROGRESS_FORMAT = "{GREEN}Progress: %d/%d quests completed|r",
    
    -- Mensagens de erro/sucesso
    NO_QUESTS_IN_LIST = "{ORANGE}No quests in the list. Use /qc add [ID] to add one.|r",
    QUEST_ADDED = "{GREEN}Quest #%d added to the list.|r",
    QUEST_ALREADY_IN_LIST = "{ORANGE}Quest #%d is already in the list.|r",
    QUEST_REMOVED = "{ORANGE}Quest #%d removed from the list.|r",
    QUEST_NOT_FOUND = "{RED}Quest #%d not found in the list.|r",
    QUEST_LIST_CLEARED = "{ORANGE}Quest list cleared.|r",
    ERROR_INVALID_QUEST_ID = "{RED}Error: Invalid quest ID.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Unknown command. Type /qc help for help.|r",
    QUEST_UNKNOWN = "Quest #%d",
    
    -- Configurações
    CONFIG_DETAILS = "Show details: %s",
    CONFIG_CHAT = "Chat output: %s",
    CONFIG_QUESTS_COUNT = "Quests in list: %d",
    CONFIG_LOCALE = "Current language: %s",
    CONFIG_AVAILABLE_LOCALES = "Available languages:",
    CONFIG_COMMANDS_HEADER = "{YELLOW}Configuration commands:|r",
    CONFIG_DETAILS_CMD = "{YELLOW}/qc config details on/off|r - Enable/disable quest details",
    CONFIG_CHAT_CMD = "{YELLOW}/qc config chat on/off|r - Enable/disable chat output",
    CONFIG_LOCALE_CMD = "{YELLOW}/qc config locale [CODE]|r - Change language (enUS, ptBR, esES)",
    CONFIG_DETAILS_ENABLED = "{GREEN}Quest details enabled.|r",
    CONFIG_DETAILS_DISABLED = "{RED}Quest details disabled.|r",
    CONFIG_CHAT_ENABLED = "{GREEN}Chat output enabled.|r",
    CONFIG_CHAT_DISABLED = "{RED}Chat output disabled.|r",
    
    -- Status
    STATUS_ENABLED = "{GREEN}Enabled|r",
    STATUS_DISABLED = "{RED}Disabled|r",
    
    -- Localização
    LOCALE_CHANGED = "{GREEN}Language changed to %s.|r",
    LOCALE_NOT_AVAILABLE = "{RED}Language %s is not available.|r",
    
    -- Ajuda
    HELP_CHECK = "{YELLOW}/qc|r or {YELLOW}/questcheck|r - Check all quests",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Add a quest to the list",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove a quest from the list",
    HELP_LIST = "{YELLOW}/qc list|r - Show quest list",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Clear quest list",
    HELP_CONFIG = "{YELLOW}/qc config|r - Settings",
    HELP_LOCALE = "{YELLOW}/qc locale [CODE]|r - Change language",
    HELP_HELP = "{YELLOW}/qc help|r - Show this help",
}