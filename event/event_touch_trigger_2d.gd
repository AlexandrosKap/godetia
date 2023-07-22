# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends Area2D
class_name EventTouchTrigger2D

const TRIGGER_FUNC_NAME := "on_trigger"
const TRIGGER_FUNC_ARG_COUNT := 0
const NONE_TIME := -1

var event: Area2D
var delay: float
var is_hot: bool
var is_active: bool
var _timer: float

func _init() -> void:
	_timer = NONE_TIME

func _ready() -> void:
	connect("area_entered", on_enter)
	connect("area_exited", on_exit)

func _process(_delta: float) -> void:
	if is_active and _timer >= 0:
		_timer += _delta
		if _timer >= delay:
			_timer = 0 if is_hot else NONE_TIME
			trigger()

## Calls the trigger function of the current event.
func trigger() -> void:
	if event != null:
		event.call(TRIGGER_FUNC_NAME)

func on_enter(node: Area2D) -> void:
	if node.has_method(TRIGGER_FUNC_NAME):
		event = node
		_timer = 0

func on_exit(node: Area2D) -> void:
	if node == event:
		event = null
		_timer = NONE_TIME
