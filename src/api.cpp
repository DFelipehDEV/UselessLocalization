#include "../useless.hpp"
#include <unordered_map>
#include <string>

std::string g_locale = "en";
std::string g_fallback_locale = "en";
std::unordered_map<std::string, std::string> g_translations;

GMREAL local_get_version() {
    return 0.1;
}

GMSTRING local_get_locale() {
    return const_cast<char*>(g_locale.c_str());
}

GMREAL local_set_locale(const char* language) {
    g_locale = language;
    return 1.0;
}

GMREAL local_set_fallback(const char* language) {
    g_fallback_locale = language;
    return 1.0;
}

GMREAL local_clear() {
    g_translations.clear();
    return 1.0;
}

GMREAL local_set(const char* key, const char* value) {
    g_translations[g_locale + "." + key] = value;
    return 1.0;
}

GMSTRING t__(const char* key) {
    const std::string k = g_locale + "." + key;
    if (g_translations.count(k)) return const_cast<char*>(g_translations[k].c_str());
    
    if (g_locale != g_fallback_locale) {
        const std::string fb_k = g_fallback_locale + "." + key;
        if (g_translations.count(fb_k)) return const_cast<char*>(g_translations[fb_k].c_str());
    }
    
    return const_cast<char*>(key);
}