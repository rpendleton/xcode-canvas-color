XcodeCanvasColor
===============

A simple Xcode IDE Plugin that changes the background color of the storyboard
editor.

The color is currently hard coded to a light gray color. This can be changed in
`NSView+CanvasBackground.m`.

## Compatibility

This plugin works with Xcode 6 and 7 (and potentially other versions as well).
Unfortunately, Apple removed support for third-party extensions in Xcode 8.
While it is possible to circumvent this by removing the code signature from
Xcode, that simply isn't a solution I'm comfortable recommending to others.

For more information and potential solutions regarding this change, see
[alcatraz/Alcatraz#475][xcode8-issue].

[xcode8-issue]: https://github.com/alcatraz/Alcatraz/issues/475

## Installation

- Alcatraz Installation: This plugin is available for installation via
  [Alcatraz][1], an open-source package manager for Xcode. Just search for
  "XcodeCanvasColor", then click Install.
  
- Manual Installation: Alternatively, the plugin can be installed manually.
  (This is currently the only way to choose the new background color.) Simply
  compile the Xcode project and the plugin will be installed in the appropriate
  location. After restarting Xcode, the storyboard editor should use the new
  color for the background.

[1]: http://alcatraz.io/

## Troubleshooting

If the plugin doesn't seem to be loading, before filing issues, please read the
following section regarding compatibility UUID's.

### Compatibility UUID's

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

## Screenshot

![screenshot](/../gh-pages/screenshot.png?raw=true)
