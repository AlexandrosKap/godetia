# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

# NOTE: Not done!

extends RefCounted
class_name InventorySystem

const IDX_ERR_MSG := "row or column out of range"

var items: Array[InventoryItemData]
var rows: int
var cols: int

func _init(_rows: int, _cols: int) -> void:
	rows = _rows
	cols = _cols
	for row in range(rows):
		for col in range(cols):
			items.append(InventoryItemData.new())

func is_valid_idx(row: int, col: int) -> bool:
	return row >= 0 and row < rows and col >= 0 and col < cols

func get_item(row: int, col: int) -> InventoryItemData:
	if not is_valid_idx(row, col):
		assert(false, IDX_ERR_MSG)
	return items[cols * row + col]

func append_item(id: int, count: int) -> void:
	for item in items:
		if item.is_none():
			item.change(id, count)
			break

func remove_item(row: int, col: int) -> void:
	if not is_valid_idx(row, col):
		assert(false, IDX_ERR_MSG)
	if items.is_empty() or items[0].is_none():
		return
	var last: InventoryItemData
	for item in items:
		if item.is_none():
			break
		last = item
	items[cols * row + col].change(last.id, last.count)
	last.change_to_none()

func remove_last_item() -> void:
	if items.is_empty() or items[0].is_none():
		return
	var last: InventoryItemData
	for item in items:
		if item.is_none():
			break
		last = item
	last.change_to_none()

func remove_all_items() -> void:
	for item in items:
		if item.is_none():
			break
		item.change_to_none()
