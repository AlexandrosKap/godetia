# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends Area2D
class_name EventTouchTrigger2D

const TRIGGER_FUNC_NAME := "on_trigger"
const TRIGGER_FUNC_ARG_COUNT := 0

@export var delay: float
@export var is_hot: bool
@export var is_active: bool = true
var event: Area2D

var _timer: float = -1

func _ready() -> void:
	connect("area_entered", on_enter)
	connect("area_exited", on_exit)

func _process(_delta: float) -> void:
	if is_active and _timer >= 0:
		_timer += _delta
		if _timer >= delay:
			_timer = 0 if is_hot else -1
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
		_timer = -1
