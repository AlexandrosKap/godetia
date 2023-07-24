# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name InventoryItemData

const NONE_ID := -1

var id: int
var count: int

func is_none() -> bool:
	return id == NONE_ID

func is_some() -> bool:
	return id != NONE_ID

func to(_id: int, _count: int) -> void:
	id = _id
	count = _count

func to_none() -> void:
	to(NONE_ID, 0)
