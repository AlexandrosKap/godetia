# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name InventorySystem

var items: Array[InventoryItemData]
var rows: int
var cols: int

func _init(_rows: int, _cols: int) -> void:
	rows = _rows
	cols = _cols
	for row in range(rows):
		for col in range(cols):
			var it := InventoryItemData.new()
			it.make_none()
			items.append(it)

func count() -> int:
	var result := 0
	for it in items:
		if it.is_some():
			result += 1
	return result

func count_area(row1: int, col1: int, row2: int, col2: int) -> int:
	var result := 0
	for row in range(row1, row2 + 1):
		for col in range(col1, col2 + 1):
			if items[cols * row + col].is_some():
				result += 1
	return result

func item(row: int, col: int) -> InventoryItemData:
	return items[cols * row + col]

func swap(row1: int, col1: int, row2: int, col2: int) -> void:
	var temp := items[cols * row1 + col1]
	items[cols * row1 + col1] = items[cols * row2 + col2]
	items[cols * row2 + col2] = temp

func remove(row: int, col: int) -> void:
	if items.is_empty():
		return
	for i in range(cols * row + col, len(items)):
		if i + 1 >= len(items):
			break
		items[i] = items[i + 1]
	items[len(items) - 1].make_none()

func append(_id: int, _count: int) -> void:
	for it in items:
		if it.is_none():
			it.change(_id, _count)
			break

func append_and_merge(_id: int, _count: int) -> void:
	for it in items:
		if it.is_none() or it.id == _id:
			it.id = _id
			it.count += _count
			break

func clean() -> void:
	for it in items:
		it.make_none()

func organize() -> void:
	for i in range(len(items)):
		if items[i].is_none():
			var old := i
			for j in range(i, len(items)):
				if items[j].is_some():
					items[i].change(items[j].id, items[j].count)
					items[j].make_none()
					i = j
					break
			if i == old:
				break
