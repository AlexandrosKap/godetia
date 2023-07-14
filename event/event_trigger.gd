# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends Area2D

const Event := preload("res://packages/godetia/event/event.gd")
const InputManager := preload("res://packages/godetia/input/input_manager.gd")

@export var action: String = "ui_accept"
@export var is_touch: bool
var event: Node

func _ready() -> void:
	connect("area_entered", on_enter)
	connect("area_exited", on_exit)

func _input(_event: InputEvent) -> void:
	if not is_touch and event != null:
		if InputManager.is_pressed(action):
			Event.trigger(event)

func on_enter(node: Node) -> void:
	if Event.is_event(node):
		event = node
		if is_touch:
			Event.trigger(event)

func on_exit(node: Node) -> void:
	if node == event:
		event = null
