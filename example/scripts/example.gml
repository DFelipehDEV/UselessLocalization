local_add_from_json(working_directory + "\languages.json");
local_set_fallback("en");
local_set_locale("en");
show_message("EN play: " + t_("menu.play")); // Output: "Play"

local_set_locale("es");
show_message("ES hello: " + t_("dialog.hello", "Alice", "UselessLocalization")); // Output: "¡Hola Alice, bienvenido a UselessLocalization!"

// Assuming we added a key to English but forgot to add it to Spanish
local_set_locale("en");
local_set("new.key", "I am only in English");

local_set_locale("es");
show_message("Fallback test: " + t_("new.key")); // Output: "I am only in English" (fell back to EN)

local_set_locale("en");
show_message("EN give: " + t_("action.give", "Sword", "Bob")); // Output: "You gave the Sword to Bob."

local_set_locale("es");
show_message("ES give: " + t_("action.give", "Sword", "Bob")); // Output: "Le entregaste a Bob el objeto: Sword."
