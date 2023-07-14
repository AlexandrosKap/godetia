# Copyright (c) 2023 Alexandros F. G. Kapretsos
# Distributed under the MIT License, see LICENSE file.

extends RefCounted

const EVENT_TRIGGER_FUNC_NAME := "on_trigger"

## Returns true if node is an event.
static func is_event(node: Node) -> bool:
	return node.has_method(EVENT_TRIGGER_FUNC_NAME)

## Calls the trigger function of the event.
## Returns true if calling failed.
static func trigger(event: Node) -> bool:
	if not is_event(event):
		return true
	event.call(EVENT_TRIGGER_FUNC_NAME)
	return false
