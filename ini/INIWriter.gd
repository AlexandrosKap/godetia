extends RefCounted

const INI := preload("res://packages/godetia/ini/INI.gd")

var _content: String

## Returns the current content of the writer.
func content() -> String:
	return _content

## Resets the current content of the writer.
func reset() -> void:
	_content = ""

## Writes a new group.
## Returns true if writing was successful.
func write_group(group: String) -> bool:
	if not INI.is_group_string(group):
		return false
	_content += group
	_content += "\n"
	return true

## Writes a new pair.
## Returns true if writing was successful.
func write_pair(key: String, value: String) -> bool:
	if not INI.is_key_string(key):
		return false
	_content += key
	_content += "="
	_content += value
	_content += "\n"
	return true
