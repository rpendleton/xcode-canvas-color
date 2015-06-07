xcode-canvas-color
===============

A simple Xcode IDE Plugin that changes the background color of the storyboard
editor.

### Installation and Usage

- The color is currently hard coded to a light gray color. This can be changed
  in `NSView+CanvasBackground.m`.
- After changing the color (if desired), compile the Xcode project and the
  plugin will be installed automatically. After restarting Xcode, the storyboard
  editor should be using the new color for the background.
- If the plugin doesn't seem to be loading, before filing issues, please read
  the following section regarding compatibility UUID's.

### A Note Regarding Compatibility UUID's

Apple does not currently provide an official API for the development of Xcode
plugins, and as such, this plugin may not be automatically loaded after Xcode is
updated. In order to fix this, the `Info.plist` of the plugin must be modified
to include the latest `DVTPlugInCompatibilityUUID` from `Xcode.app`.

The root of this repository contains a script that can be used to automatically
add the current compatibility UUID of Xcode to the plugin's `Info.plist`. To use
the script, simply run it in Terminal:

	$ ./update-uuid.sh
	Xcode 6.3.2
	UUID: E969541F-E6F9-4D25-8158-72DC3545A6C6

	Added new UUID to plugin for Xcode 6.3.2

You may also specify a custom location for your Xcode installation or plugin
bundle location:

	Usage: update.sh [path_to_xcode.app [path_to_plugin.ideplugin]]

	Examples:
	    ./update-uuid.sh
	    ./update-uuid.sh /Applications/Xcode-Beta.app
	    ./update-uuid.sh /Applications/Xcode.app ~/Library/Developer/Xcode/Plug-ins/MyIBCanvasColor.ideplugin

### Screenshot

![screenshot](/../gh-pages/screenshot.png?raw=true)
