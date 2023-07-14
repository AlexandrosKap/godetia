# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends Area3D

const Event := preload("res://packages/godetia/event/event.gd")

@export var delay: float
@export var is_hot: bool
@export var is_active: bool = true
var event: Node

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
		event.call(Event.TRIGGER_FUNC_NAME)

func on_enter(node: Node) -> void:
	if node.has_method(Event.TRIGGER_FUNC_NAME):
		event = node
		_timer = 0

func on_exit(node: Node) -> void:
	if node == event:
		event = null
		_timer = -1
