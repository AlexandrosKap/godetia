# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted

## Returns true if a file exists.
static func exists(path: String) -> bool:
	return FileAccess.file_exists(path)

## Reads a file.
## Returns an empty array if the path does not exist.
static func read(path: String) -> PackedByteArray:
	if not exists(path):
		return PackedByteArray()
	return FileAccess.get_file_as_bytes(path)

## Reads a text file.
## Returns an empty string if the path does not exist.
static func read_text(path: String) -> String:
	if not exists(path):
		return ""
	return FileAccess.get_file_as_string(path)
