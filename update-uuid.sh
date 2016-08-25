#!/bin/bash

echoerr() {
	echo "$@" 1>&2
}

realpath() {
	perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"
}

print_usage() {
	echoerr "Usage: update.sh [path_to_xcode.app [path_to_plugin.xcplugin]]"
	echoerr -e "\nExamples:"
	echoerr "    $0"
	echoerr "    $0 /Applications/Xcode-6b4.app"
}

add_uuid() {
	XCODE_INFO=$1
	PLUGIN_INFO=$2

	XCODE_VERSION=$(defaults read "$XCODE_INFO" CFBundleShortVersionString)
	NEW_UUID=$(defaults read "$XCODE_INFO" DVTPlugInCompatibilityUUID)

	echo "Xcode $XCODE_VERSION"
	echo -e "UUID: $NEW_UUID\n"

	defaults read "$PLUGIN_INFO" DVTPlugInCompatibilityUUIDs | grep $NEW_UUID > /dev/null
	exists=$?

	if [ $exists -eq 0 ]; then
		echo Plugin already contains UUID for version $version
	else
		defaults write "$PLUGIN_INFO" DVTPlugInCompatibilityUUIDs -array-add $NEW_UUID
		echo Added new UUID to plugin for Xcode $XCODE_VERSION
	fi
}

main() {
	if [ $# -le 1 ]; then
		PLUGIN=$(realpath ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/XcodeCanvasColor.xcplugin)
	else
		PLUGIN=$(realpath $2)
	fi

	if [ $# -eq 0 ]; then
		XCODE=$(realpath /Applications/Xcode.app)
	else
		XCODE=$(realpath $1)
	fi

	PLUGIN_INFO="$PLUGIN/Contents/Info.plist"
	XCODE_INFO="$XCODE/Contents/Info.plist"

	if [ ! -w "$PLUGIN_INFO" ]; then
		echoerr -e "Couldn't find plugin at $PLUGIN\n"
		print_usage
		exit 1
	elif [ ! -r "$XCODE_INFO" ]; then
		echoerr -e "Couldn't find Xcode at $XCODE\n"
		print_usage
		exit 1
	else
		add_uuid "$XCODE_INFO" "$PLUGIN_INFO"
	fi
}

main $@
