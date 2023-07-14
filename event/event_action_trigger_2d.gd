# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends Area2D

const Event := preload("res://packages/godetia/event/event.gd")
const InputManager := preload("res://packages/godetia/input/input_manager.gd")

@export var action: String = "ui_accept"
@export var is_active: bool = true
var event: Node

func _ready() -> void:
	connect("area_entered", on_enter)
	connect("area_exited", on_exit)

func _process(_delta: float) -> void:
	if is_active and InputManager.is_pressed(action):
		trigger()

## Calls the trigger function of the current event.
func trigger() -> void:
	if event != null:
		event.call(Event.TRIGGER_FUNC_NAME)

func on_enter(node: Node) -> void:
	if node.has_method(Event.TRIGGER_FUNC_NAME):
		event = node

func on_exit(node: Node) -> void:
	if node == event:
		event = null
