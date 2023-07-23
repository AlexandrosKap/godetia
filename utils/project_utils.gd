# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name ProjectUtils

static func viewport_width() -> int:
	return ProjectSettings.get_setting("display/window/size/viewport_width")

static func viewport_height() -> int:
	return ProjectSettings.get_setting("display/window/size/viewport_height")

static func viewport_size() -> Vector2:
	return Vector2(viewport_width(), viewport_height())

static func window_width_override() -> int:
	var w: int = ProjectSettings.get_setting("display/window/size/window_width_override")
	if w == 0:
		return viewport_width()
	return w

static func window_height_override() -> int:
	var h: int = ProjectSettings.get_setting("display/window/size/window_height_override")
	if h == 0:
		return viewport_height()
	return h

static func window_size_override() -> Vector2:
	return Vector2(window_width_override(), window_height_override())
