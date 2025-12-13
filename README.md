# QuestChecker - World of Warcraft Addon

## Overview

QuestChecker is a lightweight World of Warcraft addon designed to help players track the completion status of specific quests across multiple characters. It features dual-list management with both character-specific and global quest tracking capabilities.

## Features

### 📋 Dual Quest Management
- **Character-Specific Quests**: Track quests unique to each character
- **Global Quests**: Maintain a shared quest list across all characters on your account
- **Separate Tracking**: Clear distinction between personal and shared objectives

### 🔧 Flexible Commands
- **Check Status**: Verify completion status of tracked quests
- **Add/Remove**: Easily manage both character and global quest lists
- **List View**: Display all tracked quests with completion indicators
- **Configuration**: Customize display options and behavior

### 🌐 Multi-Language Support
- **English (enUS)**: Default language
- **Portuguese (ptBR)**: Brazilian Portuguese localization
- **Spanish (esES)**: Spanish localization
- **Auto-detection**: Automatically uses your client's language
- **Manual Switching**: Change languages on-the-fly

### ⚙️ Customization Options
- **Detailed/Simple Views**: Toggle between detailed and simplified quest information
- **Color-coded Status**: Green for completed, red for incomplete quests

## Installation

1. Download the QuestChecker addon package
2. Extract to your World of Warcraft addons folder:
   - Windows: `World of Warcraft\_retail_\Interface\AddOns\QuestChecker\`
   - Mac: `World of Warcraft/_retail_/Interface/AddOns/QuestChecker/`
3. Launch World of Warcraft
4. Ensure "QuestChecker" is enabled in your addons list

## Usage

### Basic Commands
- `/qc` or `/questcheck` - Check all tracked quests
- `/qc help` - Display help information
- `/qc config` - Open configuration settings

### Quest Management

**Character Quests:**
```bash
/qc add 12345          # Add quest to character list
/qc remove 12345       # Remove quest from character list
/qc list char          # List character-specific quests
```

**Global Quests:**
```bash
/qc add global 12345   # Add quest to global list
/qc remove global 12345 # Remove quest from global list
/qc list global        # List global quests
```

**Batch Operations:**
```bash
/qc                   # List all quests (character + global)
/qc list              # List all quests (character + global)
/qc clear char        # Clear character quest list
/qc clear global      # Clear global quest list
```

### Configuration

**Display Options:**
```bash
/qc config details on/off    # Toggle detailed quest information
```

**Language Settings:**
```bash
/qc locale enUS      # Switch to English
/qc locale ptBR      # Switch to Portuguese
/qc locale esES      # Switch to Spanish
```

## Default Quest List

The addon comes with a pre-configured list of quests (IDs: 85460, 82706, 91173, 82679, 82449) that you can customize as needed.

## Technical Details

### Database Structure
```lua
QuestCheckerDB = {
    globalQuestList = {},      -- Shared across all characters
    characterQuests = {},      -- Per-character quest storage
    showQuestDetails = true,   -- Display settings
    locale = "enUS"            -- Language setting
}
```

### API for Other Addons
```lua
_G.QuestChecker = {
    CheckQuest = function(questID),        -- Check specific quest status
    AddCharacterQuest = function(questID), -- Add to character list
    AddGlobalQuest = function(questID),    -- Add to global list
    RemoveCharacterQuest = function(questID), -- Remove from character list
    RemoveGlobalQuest = function(questID), -- Remove from global list
    GetCharacterQuestList = function(),    -- Get character's quests
    GetGlobalQuestList = function(),       -- Get global quests
    IsQuestCompleted = function(questID),  -- Check quest completion
    GetLocaleData = function(),            -- Get localization data
    SetLocale = function(locale)           -- Change language
}
```

## Compatibility

- **WoW Version**: Retail
- **Interface**: 11.0.0
- **Dependencies**: None - standalone addon
- **Memory Usage**: Minimal footprint

## Troubleshooting

### Common Issues

1. **Addon not loading**: Ensure it's properly extracted to the AddOns folder
2. **Commands not working**: Try `/reload` to reload the UI
3. **Quest status incorrect**: Some quests may require zone-specific completion checks

### Error Messages
- "attempt to index field 'characterQuests' (a nil value)": Run `/qc config` to initialize database
- "Invalid quest ID": Ensure you're using numeric quest IDs
- "Unknown command": Check syntax with `/qc help`

## Localization Contribution

Want to add your language? The addon supports easy localization:

1. Create a new entry in `QuestCheckerLocale` table
2. Translate all strings from the English version
3. Submit a pull request on GitHub

## Changelog

### Version 1.0
- Initial release with dual-list management
- Multi-language support
- Complete command set for quest management

## License

This addon is released under the MIT License. Feel free to modify and distribute as needed.

## Credits

Created for the World of Warcraft community. Special thanks to translators and testers who contributed to localization and bug fixes.

## Support

For bug reports, feature requests, or questions:
- Open an issue on GitHub
- In-game: Use `/qc config` for addon-specific support

---

**Note**: This addon is not affiliated with or endorsed by Blizzard Entertainment. World of Warcraft and related content are trademarks of Blizzard Entertainment, Inc.
