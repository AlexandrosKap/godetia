# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted

# NOTE: Not done!

const NONE_ID := -1

var id: int
var count: int

func _init(_id: int, _count: int) -> void:
	id = _id
	count = _count

func is_some() -> bool:
	return id != NONE_ID

func is_none() -> bool:
	return id == NONE_ID

func change(_id: int, _count: int) -> void:
	id = _id
	count = _count

func change_to_none() -> void:
	id = NONE_ID
	count = 0
