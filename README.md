# 🐐 Godetia (WIP)

A helper library for the Godot Game Engine.

Godetia is designed to be a simple base for things that are often needed when creating a video game.
Things like managing objects in an inventory,
parsing configuration files,
and other similar things are included in this library.

## 📚 Classes

* EventActionTrigger2D
* EventActionTrigger3D
* EventTouchTrigger2D
* EventTouchTrigger3D
* INI
* INIReader
* INIWriter
* InputManager
* InventoryItem (WIP)
* InventorySystem (WIP)

## 📦 Installation

First, if you haven't already done so, create a `res://addons/` folder inside your Godot project.
To install the library, add the `addons/godetia/` folder that is in this repository into the `res://addons/` folder.

## 🎨 Godetia Style

The Godetia Style is a set of style conventions for writing Godot programs.

* Each class should be its own file.
* Procedures that are likely to fail should return an error value.
* Use `assert(false)` to indicate that something should not happen.

## 📌 License

The project is released under the terms of the MIT License.
Please refer to the LICENSE file.
