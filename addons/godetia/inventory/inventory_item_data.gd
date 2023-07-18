# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

# NOTE: Not done!

extends RefCounted
class_name InventoryItemData

const NONE_ID := -1

var id: int = NONE_ID
var count: int
var group: int

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
