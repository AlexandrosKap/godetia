# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends Area3D
class_name EventActionTrigger3D

const TRIGGER_FUNC_NAME := "on_trigger"
const TRIGGER_FUNC_ARG_COUNT := 0

@export var action: String = "ui_accept"
@export var is_active: bool = true
var event: Area3D

func _ready() -> void:
	connect("area_entered", on_enter)
	connect("area_exited", on_exit)

func _process(_delta: float) -> void:
	if is_active and Input.is_action_just_pressed(action):
		trigger()

## Calls the trigger function of the current event.
func trigger() -> void:
	if event != null:
		event.call(TRIGGER_FUNC_NAME)

func on_enter(node: Area3D) -> void:
	if node.has_method(TRIGGER_FUNC_NAME):
		event = node

func on_exit(node: Area3D) -> void:
	if node == event:
		event = null
