-- Locale em português brasileiro (ptBR)
QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["ptBR"] = {
    -- Informações do locale
    LOCALE_NAME = "Português (Brasil)",

    -- Mensagens de inicialização
    ADDON_LOADED = "{GREEN}QuestChecker|r carregado. Digite {YELLOW}/qc|r ou {YELLOW}/questcheck|r para usar.",
    COMMANDS_AVAILABLE_HEADER = "Comandos disponíveis:",

    -- Comandos principais
    COMMAND_CHECK = "{YELLOW}/qc|r - Verifica todas as missões da lista",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Adiciona uma missão à lista do personagem",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove uma missão da lista do personagem",
    COMMAND_LIST = "{YELLOW}/qc list|r - Mostra todas as missões das duas listas",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Abre configurações",

    -- Novos comandos para gerenciamento personagem/global
    COMMAND_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Adiciona missão à lista global",
    COMMAND_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Remove missão da lista global",
    COMMAND_CHAR_LIST = "{YELLOW}/qc list char|r - Lista apenas missões do personagem",
    COMMAND_GLOBAL_LIST = "{YELLOW}/qc list global|r - Lista apenas missões globais",

    -- Status das missões
    STATUS_COMPLETE = "COMPLETA",
    STATUS_INCOMPLETE = "INCOMPLETA",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETA|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETA|r",

    -- Formatação de mensagens
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETA|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETA|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",

    -- Cabeçalhos
    CHECK_HEADER = "{GREEN}=== Verificação de Missões ===",
    LIST_HEADER = "{GREEN}=== Lista de Missões ===",
    CONFIG_HEADER = "{GREEN}=== Configurações do QuestChecker ===",
    HELP_HEADER = "{GREEN}=== Ajuda do QuestChecker ===",

    -- Cabeçalhos específicos
    CHECK_NAMED_HEADER = "{ORANGE}Verificando missões %s:",
    LIST_CHARACTER_HEADER = "Missões do Personagem (%s):",
    LIST_GLOBAL_HEADER = "Missões Globais:",

    -- Mensagens de progresso
    PROGRESS_FORMAT = "{GREEN}Progresso: %d/%d missões completadas|r",
    TOTAL_SUMMARY = "Resumo Total:",
    CHARACTER_PROGRESS = "Missões do Personagem: %d/%d completadas",
    GLOBAL_PROGRESS = "Missões Globais: %d/%d completadas",
    TOTAL_QUESTS_COUNT = "Total: %d missões",

    -- Mensagens de erro/sucesso
    NO_QUESTS_IN_LIST = "{ORANGE}Nenhuma missão na lista. Use /qc add [ID] para adicionar uma.|r",
    NO_QUESTS_IN_NAMED_LIST = "{ORANGE}Nenhuma missão na lista %s.",
    NO_CHARACTER_QUESTS = "{ORANGE}Você não tem missões específicas do personagem.",
    NO_GLOBAL_QUESTS = "{ORANGE}Não há missões globais.",

    QUEST_ADDED = "{GREEN}Missão #%d adicionada à lista.|r",
    QUEST_ADDED_CHARACTER = "Missão {YELLOW}%d (%s)|r adicionada à lista do seu personagem.",
    QUEST_ADDED_GLOBAL = "Missão %d adicionada à lista global.",

    QUEST_ALREADY_IN_LIST = "{ORANGE}Missão #%d já está na lista.|r",
    QUEST_ALREADY_IN_CHAR_LIST = "Missão %d já está na lista do seu personagem.",
    QUEST_ALREADY_IN_GLOBAL_LIST = "Missão %d já está na lista global.",

    QUEST_REMOVED = "{ORANGE}Missão #%d removida da lista.|r",
    QUEST_REMOVED_CHARACTER = "Missão %d removida da lista do seu personagem.",
    QUEST_REMOVED_GLOBAL = "Missão %d removida da lista global.",

    QUEST_NOT_FOUND = "{RED}Missão #%d não encontrada na lista.|r",
    QUEST_NOT_FOUND_CHARACTER = "Missão %d não encontrada na lista do seu personagem.",
    QUEST_NOT_FOUND_GLOBAL = "Missão %d não encontrada na lista global.",

    QUEST_LIST_CLEARED = "{ORANGE}Lista de missões limpa.|r",
    CHARACTER_QUEST_LIST_CLEARED = "Lista de missões do personagem limpa.",
    GLOBAL_QUEST_LIST_CLEARED = "Lista de missões globais limpa.",

    ERROR_INVALID_QUEST_ID = "{RED}Erro: ID de missão inválido.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Comando desconhecido. Digite /qc help para ajuda.|r",
    ERROR_INVALID_SYNTAX = "{RED}Erro: Sintaxe inválida.",

    QUEST_UNKNOWN = "Missão #%d",

    -- Instructions for invalid syntax
    INSTRUCTION_ADD_QUEST = "Use: /qc add <ID> ou /qc add global <ID>",
    INSTRUCTION_REMOVE_QUEST = "Use: /qc remove <ID> ou /qc remove global <ID>",
    INSTRUCTION_CLEAR_QUEST = "Use: /qc clear char ou /qc clear global",

    -- Categorias
    CHARACTER_QUESTS = "Personagem",
    GLOBAL_QUESTS = "Global",

    -- Configurações
    CONFIG_DETAILS = "Mostrar detalhes: %s",
    CONFIG_CHAT = "Saída no chat: %s",
    CONFIG_QUESTS_COUNT = "Missões na lista: %d",
    CONFIG_CHAR_QUESTS_COUNT = "Missões do Personagem: %d",
    CONFIG_GLOBAL_QUESTS_COUNT = "Missões Globais: %d",
    CONFIG_LOCALE = "Idioma atual: %s",
    CONFIG_AVAILABLE_LOCALES = "Idiomas disponíveis:",
    CONFIG_COMMANDS_HEADER = "{YELLOW}Comandos de configuração:|r",
    CONFIG_DETAILS_CMD = "{YELLOW}/qc config details on/off|r - Ativa/desativa detalhes das missões",
    CONFIG_CHAT_CMD = "{YELLOW}/qc config chat on/off|r - Ativa/desativa saída no chat",
    CONFIG_LOCALE_CMD = "{YELLOW}/qc config locale [CODE]|r - Muda o idioma (enUS, ptBR, esES)",
    CONFIG_DETAILS_ENABLED = "{GREEN}Detalhes das missões ativados.|r",
    CONFIG_DETAILS_DISABLED = "{RED}Detalhes das missões desativados.|r",
    CONFIG_CHAT_ENABLED = "{GREEN}Saída no chat ativada.|r",
    CONFIG_CHAT_DISABLED = "{RED}Saída no chat desativada.|r",

    -- Status
    STATUS_ENABLED = "{GREEN}Ativado|r",
    STATUS_DISABLED = "{RED}Desativado|r",

    -- Localização
    LOCALE_CHANGED = "{GREEN}Idioma alterado para %s.|r",
    LOCALE_NOT_AVAILABLE = "{RED}Idioma %s não disponível.|r",

    -- Ajuda
    HELP_CHECK = "{YELLOW}/qc|r ou {YELLOW}/questcheck|r - Verifica todas as missões (personagem e global)",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Adiciona uma missão à sua lista do personagem",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove uma missão da sua lista do personagem",
    HELP_LIST = "{YELLOW}/qc list|r - Mostra todas as missões (personagem e global)",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Limpa a lista de missões",
    HELP_CONFIG = "{YELLOW}/qc config|r - Configurações",
    HELP_LOCALE = "{YELLOW}/qc locale [CODE]|r - Muda o idioma",
    HELP_HELP = "{YELLOW}/qc help|r - Mostra esta ajuda",

    -- Novas entradas de ajuda para comandos personagem/global
    HELP_GLOBAL_ADD = "{YELLOW}/qc add global <ID>|r - Adiciona missão à lista global (compartilhada entre todos os personagens)",
    HELP_GLOBAL_REMOVE = "{YELLOW}/qc remove global <ID>|r - Remove missão da lista global",
    HELP_CHAR_LIST = "{YELLOW}/qc list char|r - Lista apenas as missões do seu personagem",
    HELP_GLOBAL_LIST = "{YELLOW}/qc list global|r - Lista apenas missões globais",
}
