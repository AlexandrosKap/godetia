# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name INI

## Returns true if c is a group character.
static func is_group_char(c: String) -> bool:
	return c != "[" and c != "]"

## Returns true if s is a group string.
static func is_group_string(s: String) -> bool:
	if s.is_empty():
		return false
	for c in s:
		if not (is_group_char(c)):
			return false
	return true

## Returns true if c is a key character.
static func is_key_char(c: String) -> bool:
	return c == "-" or c == "_" or c == "/" or \
		(c >= "a" and c <= "z") or \
		(c >= "A" and c <= "Z") or \
		(c >= "0" and c <= "9")

## Returns true if c is a key string.
static func is_key_string(s: String) -> bool:
	if s.is_empty():
		return false
	for c in s:
		if not is_key_char(c):
			return false
	return true
