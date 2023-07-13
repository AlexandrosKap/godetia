extends RefCounted

const INI := preload("res://packages/godetia/ini/INI.gd")

enum INIError {
	NONE,
	EOF,
	INVALID_LINE,
}

# File data
var _content: String

# Pair data
var group: String
var key: String
var value: String
var line_number: int
var group_pair_counter: int

func _init(content: String) -> void:
	_content = content

## Reads the next pair in the INI file.
## Returns INIError.NONE if reading was successful.
func read() -> INIError:
	if _content.is_empty():
		return INIError.EOF
	# Get current line.
	line_number += 1
	var line: String
	var nl_index := _content.find("\n")
	if nl_index == -1 or nl_index == line.length() - 1:
		line = _content.strip_edges()
		_content = ""
	else:
		line = _content.substr(0, nl_index).strip_edges()
		_content = _content.substr(nl_index + 1)
	# Read current line.
	if line.is_empty() or line[0] == "#" or line[0] == ";":
		return read()
	elif line[0] == "[" and line[line.length() - 1] == "]":
		group = line.substr(1, line.length() - 2).strip_edges()
		group_pair_counter = 0
		if not INI.is_group_string(group):
			return INIError.INVALID_LINE
		return read()
	else:
		var eq_index := line.find("=")
		if eq_index == -1 or eq_index == line.length() - 1:
			return INIError.INVALID_LINE
		key = line.substr(0, eq_index).strip_edges()
		value = line.substr(eq_index + 1).strip_edges()
		group_pair_counter += 1
		if not INI.is_key_string(key) or value.is_empty():
			return INIError.INVALID_LINE
		return INIError.NONE
