# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted

# NOTE: Not done!

const InventoryItem := preload(
	"res://packages/godetia/inventory/inventory_item.gd"
)

var items: Array[InventoryItem]
var rows: int
var cols: int

func _init(_rows: int, _cols: int) -> void:
	rows = _rows
	cols = _cols
	for row in range(rows):
		for col in range(cols):
			items.append(InventoryItem.new(InventoryItem.NONE_ID, 0))

func item(row: int, col: int) -> InventoryItem:
	return items[cols * row + col]
