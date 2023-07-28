# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name AnimationUtils

static func new_player() -> AnimationPlayer:
	var result := AnimationPlayer.new()
	result.add_animation_library("", AnimationLibrary.new())
	return result

static func last_animation(player: AnimationPlayer) -> Animation:
	var lib := player.get_animation_library("")
	var arr := lib.get_animation_list()
	return lib.get_animation(arr[len(arr) - 1])

static func append_animation(player: AnimationPlayer, duration: float, name: String) -> void:
	var lib := player.get_animation_library("")
	var animation := Animation.new()
	animation.length = duration
	lib.add_animation(name, animation)

static func append_track(player: AnimationPlayer, node: Node, property: String) -> void:
	var animation := last_animation(player)
	var track := animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track, str(node.get_path()) + ":" + property)

static func append_key(player: AnimationPlayer, time: float, value) -> void:
	var animation := last_animation(player)
	var track := animation.get_track_count() - 1
	animation.track_insert_key(track, time, value)

static func to_none_mode(player: AnimationPlayer) -> void:
	last_animation(player).loop_mode = Animation.LOOP_NONE

static func to_loop_mode(player: AnimationPlayer) -> void:
	last_animation(player).loop_mode = Animation.LOOP_LINEAR

static func to_pong_mode(player: AnimationPlayer) -> void:
	last_animation(player).loop_mode = Animation.LOOP_PINGPONG
