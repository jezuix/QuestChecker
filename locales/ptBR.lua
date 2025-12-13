QuestCheckerLocale = QuestCheckerLocale or {}
QuestCheckerLocale["ptBR"] = {
    -- Informações do locale
    LOCALE_NAME = "Português (BR)",
    
    -- Mensagens de inicialização
    ADDON_LOADED = "{GREEN}QuestChecker|r carregado. Digite {YELLOW}/qc|r ou {YELLOW}/questcheck|r para usar.",
    COMMANDS_AVAILABLE_HEADER = "Comandos disponíveis:",
    
    -- Comandos principais
    COMMAND_CHECK = "{YELLOW}/qc|r - Verifica todas as missões da lista",
    COMMAND_ADD = "{YELLOW}/qc add [ID]|r - Adiciona uma missão à lista",
    COMMAND_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove uma missão da lista",
    COMMAND_LIST = "{YELLOW}/qc list|r - Mostra todas as missões na lista",
    COMMAND_CONFIG = "{YELLOW}/qc config|r - Abre as configurações",
    
    -- Status das missões
    STATUS_COMPLETE = "COMPLETO",
    STATUS_INCOMPLETE = "INCOMPLETO",
    STATUS_COMPLETE_COLORED = "{GREEN}COMPLETO|r",
    STATUS_INCOMPLETE_COLORED = "{RED}INCOMPLETO|r",
    
    -- Formatação de mensagens
    QUEST_STATUS_DETAILED = "{WHITE}%s (#%d): %s%s",
    QUEST_STATUS_SIMPLE = "{WHITE}%s: %s%s",
    QUEST_COMPLETE_FORMAT = "{WHITE}%s (#%d) - {GREEN}COMPLETO|r",
    QUEST_INCOMPLETE_FORMAT = "{WHITE}%s (#%d) - {RED}INCOMPLETO|r",
    QUEST_LIST_FORMAT = "{WHITE}#%d - %s - %s",
    
    -- Cabeçalhos
    CHECK_HEADER = "{GREEN}=== Verificação de Missões ===",
    LIST_HEADER = "{GREEN}=== Lista de Missões ===",
    CONFIG_HEADER = "{GREEN}=== Configurações do QuestChecker ===",
    HELP_HEADER = "{GREEN}=== Ajuda do QuestChecker ===",
    
    -- Mensagens de progresso
    PROGRESS_FORMAT = "{GREEN}Progresso: %d/%d missões completas|r",
    
    -- Mensagens de erro/sucesso
    NO_QUESTS_IN_LIST = "{ORANGE}Nenhuma missão na lista. Use /qc add [ID] para adicionar.|r",
    QUEST_ADDED = "{GREEN}Missão #%d adicionada à lista.|r",
    QUEST_ALREADY_IN_LIST = "{ORANGE}A missão #%d já está na lista.|r",
    QUEST_REMOVED = "{ORANGE}Missão #%d removida da lista.|r",
    QUEST_NOT_FOUND = "{RED}Missão #%d não encontrada na lista.|r",
    QUEST_LIST_CLEARED = "{ORANGE}Lista de missões limpa.|r",
    ERROR_INVALID_QUEST_ID = "{RED}Erro: ID da missão inválido.|r",
    ERROR_UNKNOWN_COMMAND = "{RED}Comando não reconhecido. Digite /qc help para ajuda.|r",
    QUEST_UNKNOWN = "Missão #%d",
    
    -- Configurações
    CONFIG_DETAILS = "Mostrar detalhes: %s",
    CONFIG_CHAT = "Saída no chat: %s",
    CONFIG_QUESTS_COUNT = "Missões na lista: %d",
    CONFIG_LOCALE = "Idioma atual: %s",
    CONFIG_AVAILABLE_LOCALES = "Idiomas disponíveis:",
    CONFIG_COMMANDS_HEADER = "{YELLOW}Comandos de configuração:|r",
    CONFIG_DETAILS_CMD = "{YELLOW}/qc config details on/off|r - Ativa/desativa detalhes das missões",
    CONFIG_CHAT_CMD = "{YELLOW}/qc config chat on/off|r - Ativa/desativa saída no chat",
    CONFIG_LOCALE_CMD = "{YELLOW}/qc config locale [CÓDIGO]|r - Muda o idioma (enUS, ptBR, esES)",
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
    HELP_CHECK = "{YELLOW}/qc|r ou {YELLOW}/questcheck|r - Verifica todas as missões",
    HELP_ADD = "{YELLOW}/qc add [ID]|r - Adiciona uma missão à lista",
    HELP_REMOVE = "{YELLOW}/qc remove [ID]|r - Remove uma missão da lista",
    HELP_LIST = "{YELLOW}/qc list|r - Mostra lista de missões",
    HELP_CLEAR = "{YELLOW}/qc clear|r - Limpa lista de missões",
    HELP_CONFIG = "{YELLOW}/qc config|r - Configurações",
    HELP_LOCALE = "{YELLOW}/qc locale [CÓDIGO]|r - Muda o idioma",
    HELP_HELP = "{YELLOW}/qc help|r - Mostra esta ajuda",
}