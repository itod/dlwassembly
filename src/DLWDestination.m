//
//  DLWDestination.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWDestination.h"
#import "DLWParser.h"

@implementation DLWDestination

- (void)setWord:(ASWord)word inContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWRegisterDestination

- (void)setWord:(ASWord)word inContext:(DLWContext *)ctx {
    switch (self.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            ctx.registerA = word;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            ctx.registerB = word;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            ctx.registerC = word;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            ctx.registerD = word;
            break;
        default:
            TDAssert(0);
            break;
    }
}

@end

@implementation DLWMemoryDestination

- (void)setWord:(ASWord)word inContext:(DLWContext *)ctx {
    ASIndex addr = (ASIndex)self.token.doubleValue;
    [ctx setWord:word forAddress:addr];
}

@end
