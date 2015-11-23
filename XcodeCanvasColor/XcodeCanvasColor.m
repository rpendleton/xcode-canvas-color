//
//  XcodeCanvasColor.m
//  XcodeCanvasColor
//
//  Created by Ryan Pendleton on 10/18/14.
//  Copyright (c) 2014 Inline-Studios. All rights reserved.
//

#import "XcodeCanvasColor.h"
#import "NSView+CanvasBackground.h"
#import "JRSwizzle.h"

@implementation XcodeCanvasColor

+ (void)pluginDidLoad:(NSBundle *)bundle
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
		
		if ([currentApplicationName isEqualToString:@"Xcode"])
		{
			[[NSBundle bundleWithIdentifier:@"com.apple.dt.IDE.IDEInterfaceBuilderKit"] load];
			
			Class background = NSClassFromString(@"IBCanvasBackgroundView");
			
			if (background)
			{
				[background jr_swizzleMethod:@selector(drawRect:) withMethod:@selector(is_drawRect:) error:nil];
			}
		}
	});
}

@end
