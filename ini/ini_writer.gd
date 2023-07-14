# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted

const INI := preload("res://packages/godetia/ini/ini.gd")

var _content: String

## Returns the current content of the writer.
func content() -> String:
	return _content

## Resets the current content of the writer.
func reset() -> void:
	_content = ""

## Writes a new group.
## Returns true if writing failed.
func write_group(group: String) -> bool:
	if not INI.is_group_string(group):
		return true
	_content += group
	_content += "\n"
	return false

## Writes a new pair.
## Returns true if writing failed.
func write_pair(key: String, value: String) -> bool:
	if not INI.is_key_string(key):
		return true
	_content += key
	_content += "="
	_content += value
	_content += "\n"
	return false
