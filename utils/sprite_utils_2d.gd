# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name SpriteUtils2D

static func to_tile(sprite: Sprite2D,  region: Rect2) -> void:
	sprite.region_enabled = true
	sprite.region_rect = region

static func new_tile(tileset: Texture2D, region: Rect2) -> Sprite2D:
	var result := Sprite2D.new()
	result.texture = tileset
	to_tile(result, region)
	return result
