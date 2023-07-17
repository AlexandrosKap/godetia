# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted
class_name InputManager

## Returns true if the input action exists.
static func exists(action: String) -> bool:
	return InputMap.has_action(action)

## Makes a new input action.
## Returns true if the input action already exists.
static func make_action(action: String) -> bool:
	if exists(action):
		return true
	InputMap.add_action(action)
	return false

## Removes all the input events related to an input action.
## Returns true if the input action does not exist.
static func clean_action(action: String) -> bool:
	if not exists(action):
		return true
	InputMap.action_erase_events(action)
	return false

## Adds a keyboard key event to an input action.
## Returns true if the input action does not exist.
static func add_key(action: String, key: Key) -> bool:
	if not exists(action):
		return true
	var event := InputEventKey.new()
	event.keycode = key
	InputMap.action_add_event(action, event)
	return false

## Adds a gamepad button event to an input action.
## Returns true if the input action does not exist.
static func add_button(action: String, button: JoyButton) -> bool:
	if not exists(action):
		return true
	var event := InputEventJoypadButton.new()
	event.button_index = button
	InputMap.action_add_event(action, event)
	return false
