/*
 *  ATMTextLayer.m
 *  ATMHud
 *
 *  Created by Marcel Müller on 2011-03-01.
 *  Copyright (c) 2010-2011, Marcel Müller (atomcraft)
 *  All rights reserved.
 *
 *	https://github.com/atomton/ATMHud
 */

#import "ATMTextLayer.h"

@implementation ATMTextLayer
@synthesize caption;

- (id)initWithLayer:(id)layer {
	if ((self = [super init])) {
		caption = @"";
	}
	return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
	if ([key isEqualToString:@"caption"]) {
		return YES;
	} else {
		return [super needsDisplayForKey:key];
	}
}

- (void)drawInContext:(CGContextRef)ctx {
	UIGraphicsPushContext(ctx);
	
	CGRect textRect = self.bounds;
	textRect.size.height += 1; // wd 2014-02-10: without this, the second line of text is truncated on iOS 7
	
	CGRect shadowRect = textRect;
	shadowRect.origin.y -= 1;

	// wd debug code
	//[[UIColor redColor] set];
	//UIRectFill(textRect);
	
	[[UIColor blackColor] set];
	[caption drawInRect:textRect withFont:[UIFont boldSystemFontOfSize:14] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
	
	[[UIColor whiteColor] set];
	[caption drawInRect:shadowRect withFont:[UIFont boldSystemFontOfSize:14] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
	
	UIGraphicsPopContext();
}

- (void)dealloc {
	[caption release];
	[super dealloc];
}

@end
