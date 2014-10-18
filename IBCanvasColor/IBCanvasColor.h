//
//  IBCanvasColor.h
//  IBCanvasColor
//
//  Created by Ryan Pendleton on 10/18/14.
//  Copyright (c) 2014 Inline-Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDEInitialization

+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error;

@end

@interface IBCanvasColor : NSObject <IDEInitialization>

@end
