//
//  NSView+CanvasBackground.h
//  XcodeCanvasColor
//
//  Created by Ryan Pendleton on 10/18/14.
//  Copyright (c) 2014 Inline-Studios. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSView (CanvasBackground)

- (void)is_drawRect:(NSRect)dirtyRect;

@end
