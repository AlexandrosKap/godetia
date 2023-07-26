# Copyright 2023 Alexandros F. G. Kapretsos
# SPDX-License-Identifier: Apache-2.0

extends RefCounted
class_name InputUtils

## Returns true if the input action exists.
static func exists(action: String) -> bool:
	return InputMap.has_action(action)

## Removes the input action from the input map.
## Returns true if the input action does not exist.
static func remove(action: String) -> bool:
	if not exists(action):
		return true
	InputMap.erase_action(action)
	return false

## Appends a new input action to the input map.
## Returns true if the input action exists.
static func append(action: String) -> bool:
	if exists(action):
		return true
	InputMap.add_action(action)
	return false

## Removes all the input events related to an input action.
## Returns true if the input action does not exist.
static func clean(action: String) -> bool:
	if not exists(action):
		return true
	InputMap.action_erase_events(action)
	return false

## Removes all the input events from all input actions.
static func clean_all() -> void:
	for s in InputMap.get_actions():
		InputMap.action_erase_events(s)

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
