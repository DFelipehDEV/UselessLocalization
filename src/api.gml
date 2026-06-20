#define local_add_from_json
/// local_add_from_json(file)
var _file, _json;
_file = argument0;
_json = json_load_file(_file);
    
if (_json == -1) {
    var _err;
    _err = "Failed to load JSON file: " + _file;
    show_debug_message(_err);
    if (debug_mode) show_error(_err, false);
    return false;
}

var _original_locale, _languages;
_original_locale = local_get_locale();
_languages = json_get_keys(_json);

var _lang, _comma_pos, _keys, _key_comma_pos, _key, _value;
while (_languages != "") {
    _comma_pos = string_pos(",", _languages);
    
    if (_comma_pos == 0) {
        _lang = _languages;
        _languages = "";
    } else {
        _lang = string_copy(_languages, 1, _comma_pos - 1);
        _languages = string_delete(_languages, 1, _comma_pos);
    }
    
    if (_lang == "") continue;
    
    local_set_locale(_lang);
    
    _keys = json_get_nested_keys(_json, _lang);
    
    while (_keys != "") {
        _key_comma_pos = string_pos(",", _keys);
        
        if (_key_comma_pos == 0) {
            _key = _keys;
            _keys = "";
        } else {
            _key = string_copy(_keys, 1, _key_comma_pos - 1);
            _keys = string_delete(_keys, 1, _key_comma_pos);
        }
        
        if (_key == "") continue;
        
        _value = json_dotget_string(_json, _lang + "." + _key);
        local_set(_key, _value);
    }
}

local_set_locale(_original_locale);
json_delete(_json);
return true;


#define t_
/// t_(key, ...)
var _str, i;
_str = t__(argument0);
for (i = 1; i < argument_count; i += 1) {
    _str = string_replace_all(_str, "{" + string(i - 1) + "}", string(argument[i]));
}
return _str;

