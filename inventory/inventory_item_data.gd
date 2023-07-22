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

func make_none() -> void:
	id = NONE_ID
	count = 0

func change(_id: int, _count: int) -> void:
	id = _id
	count = _count
