//
//  MecabNode.h
//
//  Created by Watanabe Toshinori on 10/12/22 (originally as "Node.h").
//  Copyright 2010 FLCL.jp. All rights reserved.
//

#import <Foundation/Foundation.h> // imported implicitly via mecab_Prefix.pch

#import "mecab.h" // or #import <mecab.h> to use globally installed one

@interface MecabNode : NSObject {
    NSString *feature;
    NSArray<NSString *> *features;
    int leadingWhitespaceLength;
    NSString *trailingWhitespace;
    
    NSString *surface;
}

// These are assigned pre-emptively to MecabNode, pulled out of the mecab node.
@property (nonatomic, retain, nullable) NSString *feature;
@property (nonatomic, retain, nullable) NSArray<NSString *> *features;
@property (nonatomic, retain, nullable) NSString *trailingWhitespace;
@property (nonatomic) int leadingWhitespaceLength;

@property (nonatomic, retain, nonnull) NSString *surface;

- (int)leadingWhitespaceLength;

- (nullable NSString *)trailingWhitespace;

@end

