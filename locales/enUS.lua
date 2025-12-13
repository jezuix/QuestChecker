-- Locale in English (enUS)
QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["enUS"] = {
    -- Locale information
    LOCALE_NAME = "English (US)",

    -- Initialization messages
    ADDON_LOADED = "{GREEN}QuestChecker|r loaded. Type {YELLOW}/qc|r or {YELLOW}/questcheck|r to use.",
    COMMANDS_AVAILABLE_HEADER = "Available commands:",

    -- Main commands
    COMMAND_CHECK = "{YELLOW}/qc|r - Check all quests in the list",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Add a quest to the character list",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove a quest from the character list",
    COMMAND_LIST = "{YELLOW}/qc list|r - Show all quests in both lists",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Open settings",

    -- New commands for character/global management
    COMMAND_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Add quest to global list",
    COMMAND_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Remove quest from global list",
    COMMAND_CHAR_LIST = "{YELLOW}/qc list char|r - List only character quests",
    COMMAND_GLOBAL_LIST = "{YELLOW}/qc list global|r - List only global quests",

    -- Quest status
    STATUS_COMPLETE = "COMPLETE",
    STATUS_INCOMPLETE = "INCOMPLETE",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETE|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETE|r",

    -- Message formatting
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETE|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETE|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",

    -- Headers
    CHECK_HEADER = "{GREEN}=== Quest Check ===",
    LIST_HEADER = "{GREEN}=== Quest List ===",
    CONFIG_HEADER = "{GREEN}=== QuestChecker Settings ===",
    HELP_HEADER = "{GREEN}=== QuestChecker Help ===",

    -- List-specific headers
    CHECK_NAMED_HEADER = "{ORANGE}Checking %s quests:",
    LIST_CHARACTER_HEADER = "Character Quests (%s):",
    LIST_GLOBAL_HEADER = "Global Quests:",

    -- Progress messages
    PROGRESS_FORMAT = "{GREEN}Progress: %d/%d quests completed|r",
    TOTAL_SUMMARY = "Total Summary:",
    CHARACTER_PROGRESS = "Character Quests: %d/%d completed",
    GLOBAL_PROGRESS = "Global Quests: %d/%d completed",
    TOTAL_QUESTS_COUNT = "Total: %d quests",

    -- Success/error messages
    NO_QUESTS_IN_LIST = "{ORANGE}No quests in the list. Use /qc add [ID] to add one.|r",
    NO_QUESTS_IN_NAMED_LIST = "{ORANGE}No quests in the %s list.",
    NO_CHARACTER_QUESTS = "{ORANGE}You have no character-specific quests.",
    NO_GLOBAL_QUESTS = "{ORANGE}There are no global quests.",

    QUEST_ADDED = "{GREEN}Quest #%d added to the list.|r",
    QUEST_ADDED_CHARACTER = "Quest {YELLOW}%d (%s)|r added to your character quest list.",
    QUEST_ADDED_GLOBAL = "Quest %d added to global quest list.",

    QUEST_ALREADY_IN_LIST = "{ORANGE}Quest #%d is already in the list.|r",
    QUEST_ALREADY_IN_CHAR_LIST = "Quest %d is already in your character quest list.",
    QUEST_ALREADY_IN_GLOBAL_LIST = "Quest %d is already in the global quest list.",

    QUEST_REMOVED = "{ORANGE}Quest #%d removed from the list.|r",
    QUEST_REMOVED_CHARACTER = "Quest %d removed from your character quest list.",
    QUEST_REMOVED_GLOBAL = "Quest %d removed from global quest list.",

    QUEST_NOT_FOUND = "{RED}Quest #%d not found in the list.|r",
    QUEST_NOT_FOUND_CHARACTER = "Quest %d not found in your character quest list.",
    QUEST_NOT_FOUND_GLOBAL = "Quest %d not found in global quest list.",

    QUEST_LIST_CLEARED = "{ORANGE}Quest list cleared.|r",
    CHARACTER_QUEST_LIST_CLEARED = "Character quest list cleared.",
    GLOBAL_QUEST_LIST_CLEARED = "Global quest list cleared.",

    ERROR_INVALID_QUEST_ID = "{RED}Error: Invalid quest ID.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Unknown command. Type /qc help for help.|r",
    ERROR_INVALID_SYNTAX = "{RED}Error: Invalid syntax.",

    QUEST_UNKNOWN = "Quest #%d",
    
    -- Instructions for invalid syntax
    INSTRUCTION_ADD_QUEST = "Use: /qc add <ID> or /qc add global <ID>",
    INSTRUCTION_REMOVE_QUEST = "Use: /qc remove <ID> or /qc remove global <ID>",
    INSTRUCTION_CLEAR_QUEST = "Use: /qc clear char or /qc clear global",

    -- Categories
    CHARACTER_QUESTS = "Character",
    GLOBAL_QUESTS = "Global",

    -- Configuration
    CONFIG_DETAILS = "Show details: %s",
    CONFIG_CHAT = "Chat output: %s",
    CONFIG_QUESTS_COUNT = "Quests in list: %d",
    CONFIG_CHAR_QUESTS_COUNT = "Character Quests: %d",
    CONFIG_GLOBAL_QUESTS_COUNT = "Global Quests: %d",
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

    -- Localization
    LOCALE_CHANGED = "{GREEN}Language changed to %s.|r",
    LOCALE_NOT_AVAILABLE = "{RED}Language %s is not available.|r",

    -- Help
    HELP_CHECK = "{YELLOW}/qc|r or {YELLOW}/questcheck|r - Check all quests (character and global)",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Add a quest to your character list",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove a quest from your character list",
    HELP_LIST = "{YELLOW}/qc list|r - Show all quests (character and global)",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Clear quest list",
    HELP_CONFIG = "{YELLOW}/qc config|r - Settings",
    HELP_LOCALE = "{YELLOW}/qc locale [CODE]|r - Change language",
    HELP_HELP = "{YELLOW}/qc help|r - Show this help",

    -- New help entries for character/global commands
    HELP_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Add quest to global list (shared across all characters)",
    HELP_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Remove quest from global list",
    HELP_CHAR_LIST = "{YELLOW}/qc list char|r - List only your character's quests",
    HELP_GLOBAL_LIST = "{YELLOW}/qc list global|r - List only global quests",
}
