# 🐐 Godetia (WIP)

A helper library for the Godot Game Engine.

Godetia is designed to be a simple base for things that are often needed when creating a video game.
Things like managing objects in an inventory and other similar things are included in this library.

## 📚 Classes

* EventActionTrigger2D
* EventActionTrigger3D
* EventTouchTrigger2D
* EventTouchTrigger3D
* INI
* INIReader
* INIWriter
* InventoryItemData
* InventorySystem
* InputUtils
* ProjectUtils
* SpriteUtils2D
* SpriteUtils3D

## 📦 Installation

To install the library, run the following command inside your Godot project:

```sh
git clone https://github.com/AlexandrosKap/godetia
```

To update the library, run the following command inside the library folder:

```sh
git pull
```

## 🎨 Godetia Style

The Godetia Style is a set of style conventions for writing Godot programs.

* Each class should be its own file.
* No custom default values for class members.
* Initialize nodes in the `_init` procedure.
* Setup nodes in the `_ready` procedure.
* Procedures that are likely to fail should return an error value.
* An error of type bool should be true if something failed.
* Use `assert(false)` to indicate that something should not happen.

## 📌 License

The project is released under the terms of the Apache-2.0 License.
Please refer to the LICENSE file.
