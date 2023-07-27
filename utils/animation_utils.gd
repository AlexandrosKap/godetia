# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

# TODO: Find way to assert if given path for track is not a float.

extends RefCounted
class_name AnimationUtils

enum Kind {
	LINE,
	LOOP,
	PONG,
}

static func new_animation(duration: float, kind: Kind) -> Animation:
	var result := Animation.new()
	result.length = duration
	if kind == Kind.LINE:
		result.loop_mode = Animation.LOOP_NONE
	elif kind == Kind.LOOP:
		result.loop_mode = Animation.LOOP_LINEAR
	elif kind == Kind.PONG:
		result.loop_mode = Animation.LOOP_PINGPONG
	else:
		result.loop_mode = Animation.LOOP_NONE
	return result

static func new_animation_player() -> AnimationPlayer:
	var result := AnimationPlayer.new()
	result.add_animation_library("", AnimationLibrary.new())
	return result

static func append_track(a: Animation, path: String) -> void:
	var track := a.add_track(Animation.TYPE_VALUE)
	a.track_set_path(track, path)

static func append_key(a: Animation, time: float, value: float) -> void:
	var track := a.get_track_count() - 1
	a.track_insert_key(track, time, value)

static func append_animation(ap: AnimationPlayer, a: Animation, name: String) -> void:
	var lib := ap.get_animation_library("")
	lib.add_animation(name, a)
