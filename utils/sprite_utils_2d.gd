# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name SpriteUtils2D

static func to_tile(spr: Sprite2D,  region: Rect2) -> void:
	spr.region_enabled = true
	spr.region_rect = region

static func to_frame(spr: Sprite2D, rows: int, cols: int) -> void:
	spr.hframes = rows
	spr.vframes = cols

static func new_tile(tileset: Texture2D, region: Rect2) -> Sprite2D:
	var result := Sprite2D.new()
	result.texture = tileset
	to_tile(result, region)
	return result

static func new_frame(tileset: Texture2D, rows: int, cols: int) -> Sprite2D:
	var result := Sprite2D.new()
	result.texture = tileset
	to_frame(result, rows, cols)
	return result
