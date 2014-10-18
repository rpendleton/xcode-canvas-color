//
//  IBCanvasColor.m
//  IBCanvasColor
//
//  Created by Ryan Pendleton on 10/18/14.
//  Copyright (c) 2014 Inline-Studios. All rights reserved.
//

#import "IBCanvasColor.h"
#import "NSView+CanvasBackground.h"
#import "JRSwizzle.h"

@implementation IBCanvasColor

+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error
{
	Class background = NSClassFromString(@"IBCanvasBackgroundView");
	
	if(background)
	{
		[background jr_swizzleMethod:@selector(drawRect:) withMethod:@selector(is_drawRect:) error:nil];
	}
}

@end
