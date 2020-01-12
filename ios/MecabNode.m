//
//  MecabNode.m
//
//  Created by Watanabe Toshinori on 10/12/22 (originally as "Node.m").
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import "MecabNode.h"


@implementation MecabNode

@synthesize feature; // All features, as comma-separated string. Empty fields marked with: *
@synthesize features; // All features, parsed into array

@synthesize surface;

@synthesize leadingWhitespaceLength;
@synthesize trailingWhitespace;

// MecabObjC.m sets newNode.feature =, but never any other property (lazy setting)
- (void)setFeature:(NSString *)value {
    if (feature) [feature release];
    
    if (value) {
        feature = [value retain];
        self.features = [value componentsSeparatedByString:@","];
    } else {
        feature = nil;
        self.features = nil;
    }
}

- (void)setLeadingWhitespaceLength:(int)value {
    leadingWhitespaceLength = value;
}

- (void)setTrailingWhitespace:(NSString *)value {
    if (trailingWhitespace) [trailingWhitespace release];
    trailingWhitespace = value ? [value retain] : nil;
}

- (int)leadingWhitespaceLength {
    return leadingWhitespaceLength;
}

- (NSString *)trailingWhitespace {
    return trailingWhitespace;
}

- (void)dealloc {
    // Note: http://stackoverflow.com/a/7906891/5951226 says you shouldn't actually nil out properties in dealloc, and certainly not 'retain' ones.
    self.feature = nil;
    self.features = nil;
    // self.leadingWhitespaceLength = nil;
    
    self.trailingWhitespace = nil;
    
    [super dealloc];
}

@end

