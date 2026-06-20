# UselessLocalization
A simple localization extension for GameMaker 8.2.

## Features
- Load JSON files.
- Use dot-notation keys (e.g., `menu.play`).
- String interpolation (`t_("key", "arg1", "arg2")`).
- Automatic fallback languages.

## Quick Start
Create a `languages.json` file and add it to your Included Files:
```json
{
    "en": {
        "menu": {
            "play": "Play"
        },
        "dialog": {
            "hello": "Hello {0}, welcome to {1}!"
        }
    },
    "es": {
        "menu": {
            "play": "Jugar"
        },
        "dialog": {
            "hello": "¡Hola {0}, bienvenido a {1}!"
        }
    }
}
```

Initialize it:
```gml
local_add_from_json(working_directory + "\languages.json");
local_set_fallback("en"); // language to fallback to when there's a key missing in the current language
local_set_locale("en");
```

Get translated text:
```gml
draw_text(10, 10, t_("menu.play"));
draw_text(10, 30, t_("dialog.hello", "Alice", "Wonderland"));
```

Bind a debug key to reload your translations while playing:
```gml
if (keyboard_check_pressed(vk_f5)) {
    local_clear();
    local_add_from_json(working_directory + "\languages.json");
}
```