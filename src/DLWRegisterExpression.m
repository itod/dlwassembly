//
//  DLWRegisterExpression.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWRegisterExpression.h"
#import "DLWParser.h"

@implementation DLWRegisterExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASWord res = 0;
    
    switch (self.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            res = ctx.registerA;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            res = ctx.registerB;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            res = ctx.registerC;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            res = ctx.registerD;
            break;
        default:
            TDAssert(0);
            break;
    }
    
    return res;
}

@end
