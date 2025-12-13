-- Locale em espanhol (esES)
QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["esES"] = {
    -- Información del locale
    LOCALE_NAME = "Español (España)",

    -- Mensajes de inicialización
    ADDON_LOADED = "{GREEN}QuestChecker|r cargado. Escribe {YELLOW}/qc|r o {YELLOW}/questcheck|r para usar.",
    COMMANDS_AVAILABLE_HEADER = "Comandos disponibles:",

    -- Comandos principales
    COMMAND_CHECK = "{YELLOW}/qc|r - Verifica todas las misiones de la lista",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Añade una misión a la lista del personaje",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Elimina una misión de la lista del personaje",
    COMMAND_LIST = "{YELLOW}/qc list|r - Muestra todas las misiones de ambas listas",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Abre ajustes",

    -- Nuevos comandos para gestión personaje/global
    COMMAND_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Añade misión a la lista global",
    COMMAND_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Elimina misión de la lista global",
    COMMAND_CHAR_LIST = "{YELLOW}/qc list char|r - Lista solo misiones del personaje",
    COMMAND_GLOBAL_LIST = "{YELLOW}/qc list global|r - Lista solo misiones globales",

    -- Estado de las misiones
    STATUS_COMPLETE = "COMPLETA",
    STATUS_INCOMPLETE = "INCOMPLETA",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETA|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETA|r",

    -- Formato de mensajes
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETA|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETA|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",

    -- Encabezados
    LIST_HEADER = "{GREEN}=== Lista de Misiones ===",
    CONFIG_HEADER = "{GREEN}=== Ajustes de QuestChecker ===",
    HELP_HEADER = "{GREEN}=== Ayuda de QuestChecker ===",

    -- Encabezados específicos
    CHECK_NAMED_HEADER = "{ORANGE}Verificando misiones %s:",
    LIST_CHARACTER_HEADER = "Misiones del Personaje (%s):",
    LIST_GLOBAL_HEADER = "Misiones Globales:",

    -- Mensajes de progreso
    PROGRESS_FORMAT = "{GREEN}Progreso: %d/%d misiones completadas|r",
    TOTAL_SUMMARY = "{YELLOW}Resumen Total:",
    CHARACTER_PROGRESS = "Misiones del Personaje: %d/%d completadas",
    GLOBAL_PROGRESS = "Misiones Globales: %d/%d completadas",
    TOTAL_QUESTS_COUNT = "Total: %d misiones",

    -- Mensajes de error/éxito
    NO_QUESTS_IN_NAMED_LIST = "{ORANGE}No hay misiones en la lista %s.",
    NO_CHARACTER_QUESTS = "{ORANGE}No tienes misiones específicas del personaje.",
    NO_GLOBAL_QUESTS = "{ORANGE}No hay misiones globales.",

    QUEST_ADDED_CHARACTER = "Misión {YELLOW}%d (%s)|r añadida a tu lista del personaje.",
    QUEST_ADDED_GLOBAL = "Misión %d añadida a la lista global.",

    QUEST_ALREADY_IN_CHAR_LIST = "Misión %d ya está en tu lista del personaje.",
    QUEST_ALREADY_IN_GLOBAL_LIST = "Misión %d ya está en la lista global.",

    QUEST_REMOVED_CHARACTER = "Misión {YELLOW}%d (%s)|r eliminada de tu lista del personaje.",
    QUEST_REMOVED_GLOBAL = "Misión {YELLOW}%d (%s)|r eliminada de la lista global.",

    QUEST_NOT_FOUND_CHARACTER = "Misión %d no encontrada en tu lista del personaje.",
    QUEST_NOT_FOUND_GLOBAL = "Misión %d no encontrada en la lista global.",

    QUEST_LIST_CLEARED = "{ORANGE}Lista de misiones limpiada.|r",
    CHARACTER_QUEST_LIST_CLEARED = "Lista de misiones del personaje limpiada.",
    GLOBAL_QUEST_LIST_CLEARED = "Lista de misiones globales limpiada.",

    ERROR_INVALID_QUEST_ID = "{RED}Error: ID de misión inválido.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Comando desconocido. Escribe /qc help para ayuda.|r",
    ERROR_INVALID_SYNTAX = "{RED}Error: Sintaxis inválida.",

    QUEST_UNKNOWN = "Misión #%d",

    -- Instructions for invalid syntax
    INSTRUCTION_ADD_QUEST = "Use: /qc add <ID> o /qc add global <ID>",
    INSTRUCTION_REMOVE_QUEST = "Use: /qc remove <ID> o /qc remove global <ID>",
    INSTRUCTION_CLEAR_QUEST = "Use: /qc clear char o /qc clear global",

    -- Categorías
    CHARACTER_QUESTS = "Personaje",
    GLOBAL_QUESTS = "Global",

    -- Configuración
    CONFIG_DETAILS = "Mostrar detalles: %s",
    CONFIG_CHAR_QUESTS_COUNT = "Misiones del Personaje: %d",
    CONFIG_GLOBAL_QUESTS_COUNT = "Misiones Globales: %d",
    CONFIG_LOCALE = "Idioma actual: %s",
    CONFIG_AVAILABLE_LOCALES = "Idiomas disponibles:",
    CONFIG_COMMANDS_HEADER = "{YELLOW}Comandos de configuración:|r",
    CONFIG_DETAILS_CMD = "{YELLOW}/qc config details on/off|r - Activa/desactiva detalles de misiones",
    CONFIG_LOCALE_CMD = "{YELLOW}/qc config locale [CODE]|r - Cambia el idioma (enUS, ptBR, esES)",
    CONFIG_DETAILS_ENABLED = "{GREEN}Detalles de misiones activados.|r",
    CONFIG_DETAILS_DISABLED = "{RED}Detalles de misiones desactivados.|r",

    -- Estado
    STATUS_ENABLED = "{GREEN}Activado|r",
    STATUS_DISABLED = "{RED}Desactivado|r",

    -- Localización
    LOCALE_CHANGED = "{GREEN}Idioma cambiado a %s.|r",
    LOCALE_NOT_AVAILABLE = "{RED}Idioma %s no disponible.|r",

    -- Ayuda
    HELP_CHECK = "{YELLOW}/qc|r o {YELLOW}/questcheck|r - Verifica todas las misiones (personaje y global)",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Añade una misión a tu lista del personaje",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Elimina una misión de tu lista del personaje",
    HELP_LIST = "{YELLOW}/qc list|r - Muestra todas las misiones (personaje y global)",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Limpia la lista de misiones",
    HELP_CONFIG = "{YELLOW}/qc config|r - Ajustes",
    HELP_LOCALE = "{YELLOW}/qc locale [CODE]|r - Cambia el idioma",
    HELP_HELP = "{YELLOW}/qc help|r - Muestra esta ayuda",

    -- Nuevas entradas de ayuda para comandos personaje/global
    HELP_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Añade misión a la lista global (compartida entre todos los personajes)",
    HELP_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Elimina misión de la lista global",
    HELP_CHAR_LIST = "{YELLOW}/qc list char|r - Lista solo las misiones de tu personaje",
    HELP_GLOBAL_LIST = "{YELLOW}/qc list global|r - Lista solo misiones globales",
}
