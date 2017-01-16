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

- (void)store:(ASWord)val inContext:(DLWContext *)ctx {
    switch (self.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            ctx.registerA = val;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            ctx.registerB = val;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            ctx.registerC = val;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            ctx.registerD = val;
            break;
        default:
            TDAssert(0);
            break;
    }
}

@end
