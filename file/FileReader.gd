extends RefCounted

## Returns true if a file exists.
static func exists(path: String) -> bool:
	return FileAccess.file_exists(path)

## Reads a file.
static func read(path: String) -> PackedByteArray:
	if not exists(path):
		return PackedByteArray()
	return FileAccess.get_file_as_bytes(path)

## Reads a text file.
static func read_text(path: String) -> String:
	if not exists(path):
		return ""
	return FileAccess.get_file_as_string(path)
