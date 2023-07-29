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

static func append_oanimation(player: AnimationPlayer, duration: float, name: String) -> void:
	var lib := player.get_animation_library("")
	var animation := Animation.new()
	animation.length = duration
	animation.loop_mode = Animation.LOOP_NONE
	lib.add_animation(name, animation)

static func append_lanimation(player: AnimationPlayer, duration: float, name: String) -> void:
	var lib := player.get_animation_library("")
	var animation := Animation.new()
	animation.length = duration
	animation.loop_mode = Animation.LOOP_LINEAR
	lib.add_animation(name, animation)

static func append_panimation(player: AnimationPlayer, duration: float, name: String) -> void:
	var lib := player.get_animation_library("")
	var animation := Animation.new()
	animation.length = duration
	animation.loop_mode = Animation.LOOP_PINGPONG
	lib.add_animation(name, animation)

static func append_ntrack(player: AnimationPlayer, node: Node, property: String) -> void:
	var animation := last_animation(player)
	var track := animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track, str(node.get_path()) + ":" + property)
	animation.track_set_interpolation_type(track, Animation.INTERPOLATION_NEAREST)

static func append_ltrack(player: AnimationPlayer, node: Node, property: String) -> void:
	var animation := last_animation(player)
	var track := animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track, str(node.get_path()) + ":" + property)
	animation.track_set_interpolation_type(track, Animation.INTERPOLATION_LINEAR)

static func append_ctrack(player: AnimationPlayer, node: Node, property: String) -> void:
	var animation := last_animation(player)
	var track := animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track, str(node.get_path()) + ":" + property)
	animation.track_set_interpolation_type(track, Animation.INTERPOLATION_CUBIC)

static func append_key(player: AnimationPlayer, time: float, value) -> void:
	var animation := last_animation(player)
	var track := animation.get_track_count() - 1
	animation.track_insert_key(track, time, value)

static func append_keys(player: AnimationPlayer, values) -> void:
	var animation := last_animation(player)
	var track := animation.get_track_count() - 1
	for i in range(len(values)):
		var time: float
		if i == 0:
			time = 0
		elif i == len(values) - 1:
			time = animation.length
		else:
			time = animation.length * (float(i) / (len(values) - 1))
		animation.track_insert_key(track, time, values[i])
