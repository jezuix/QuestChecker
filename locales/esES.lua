QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["esES"] = {
    -- Informações do locale
    LOCALE_NAME = "Español (ES)",
    
    -- Mensagens de inicialização
    ADDON_LOADED = "{GREEN}QuestChecker|r cargado. Escribe {YELLOW}/qc|r o {YELLOW}/questcheck|r para usar.",
    COMMANDS_AVAILABLE_HEADER = "Comandos disponibles:",
    
    -- Comandos principais
    COMMAND_CHECK = "{YELLOW}/qc|r - Comprueba todas las misiones de la lista",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Añade una misión a la lista",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Elimina una misión de la lista",
    COMMAND_LIST = "{YELLOW}/qc list|r - Muestra todas las misiones de la lista",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Abre la configuración",
    
    -- Status de las misiones
    STATUS_COMPLETE = "COMPLETO",
    STATUS_INCOMPLETE = "INCOMPLETO",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETO|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETO|r",
    
    -- Formateo de mensajes
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETO|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETO|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",
    
    -- Encabezados
    CHECK_HEADER = "{GREEN}=== Comprobación de Misiones ===",
    LIST_HEADER = "{GREEN}=== Lista de Misiones ===",
    CONFIG_HEADER = "{GREEN}=== Configuración de QuestChecker ===",
    HELP_HEADER = "{GREEN}=== Ayuda de QuestChecker ===",
    
    -- Mensajes de progreso
    PROGRESS_FORMAT = "{GREEN}Progreso: %d/%d misiones completadas|r",
    
    -- Mensajes de error/éxito
    NO_QUESTS_IN_LIST = "{ORANGE}No hay misiones en la lista. Usa /qc add [ID] para añadir una.|r",
    QUEST_ADDED = "{GREEN}Misión #%d añadida a la lista.|r",
    QUEST_ALREADY_IN_LIST = "{ORANGE}La misión #%d ya está en la lista.|r",
    QUEST_REMOVED = "{ORANGE}Misión #%d eliminada de la lista.|r",
    QUEST_NOT_FOUND = "{RED}Misión #%d no encontrada en la lista.|r",
    QUEST_LIST_CLEARED = "{ORANGE}Lista de misiones limpiada.|r",
    ERROR_INVALID_QUEST_ID = "{RED}Error: ID de misión inválido.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Comando desconocido. Escribe /qc help para ayuda.|r",
    QUEST_UNKNOWN = "Misión #%d",
    
    -- Configuración
    CONFIG_DETAILS = "Mostrar detalles: %s",
    CONFIG_CHAT = "Salida en el chat: %s",
    CONFIG_QUESTS_COUNT = "Misiones en la lista: %d",
    CONFIG_LOCALE = "Idioma actual: %s",
    CONFIG_AVAILABLE_LOCALES = "Idiomas disponibles:",
    CONFIG_COMMANDS_HEADER = "{YELLOW}Comandos de configuración:|r",
    CONFIG_DETAILS_CMD = "{YELLOW}/qc config details on/off|r - Activa/desactiva detalles de misiones",
    CONFIG_CHAT_CMD = "{YELLOW}/qc config chat on/off|r - Activa/desactiva salida en el chat",
    CONFIG_LOCALE_CMD = "{YELLOW}/qc config locale [CÓDIGO]|r - Cambia el idioma (enUS, ptBR, esES)",
    CONFIG_DETAILS_ENABLED = "{GREEN}Detalles de misiones activados.|r",
    CONFIG_DETAILS_DISABLED = "{RED}Detalles de misiones desactivados.|r",
    CONFIG_CHAT_ENABLED = "{GREEN}Salida en el chat activada.|r",
    CONFIG_CHAT_DISABLED = "{RED}Salida en el chat desactivada.|r",
    
    -- Estado
    STATUS_ENABLED = "{GREEN}Activado|r",
    STATUS_DISABLED = "{RED}Desactivado|r",
    
    -- Localización
    LOCALE_CHANGED = "{GREEN}Idioma cambiado a %s.|r",
    LOCALE_NOT_AVAILABLE = "{RED}Idioma %s no disponible.|r",
    
    -- Ayuda
    HELP_CHECK = "{YELLOW}/qc|r o {YELLOW}/questcheck|r - Comprueba todas las misiones",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Añade una misión a la lista",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Elimina una misión de la lista",
    HELP_LIST = "{YELLOW}/qc list|r - Muestra lista de misiones",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Limpia lista de misiones",
    HELP_CONFIG = "{YELLOW}/qc config|r - Configuración",
    HELP_LOCALE = "{YELLOW}/qc locale [CÓDIGO]|r - Cambia el idioma",
    HELP_HELP = "{YELLOW}/qc help|r - Muestra esta ayuda",
}