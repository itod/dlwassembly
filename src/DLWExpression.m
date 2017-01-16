//
//  DLWExpression.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWExpression.h"
#import "DLWParser.h"

@implementation DLWExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}

@end

@implementation DLWLiteralExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    return (ASWord)self.token.doubleValue;
}

@end

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

@implementation DLWAddressExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = (ASIndex)self.token.doubleValue;
    ASWord res = [ctx wordForMemoryAddress:addr];
    return res;
}

@end

@implementation DLWIndirectionExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = 0;
    
    switch (self.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            addr = ctx.registerA;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            addr = ctx.registerB;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            addr = ctx.registerC;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            addr = ctx.registerD;
            break;
        default:
            TDAssert(0);
            break;
    }
    
    ASWord res = [ctx wordForMemoryAddress:addr];
    return res;
}

@end

@implementation DLWOffsetExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = 0;
    
    DLWExpression *regExpr = self.children[0];
    switch (regExpr.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            addr = ctx.registerA;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            addr = ctx.registerB;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            addr = ctx.registerC;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            addr = ctx.registerD;
            break;
        default:
            TDAssert(0);
            break;
    }
    
    DLWExpression *litExpr = self.children[1];
    ASIndex offset = (ASIndex)litExpr.token.doubleValue; // index or word?
    addr += offset;
    
    ASWord res = [ctx wordForMemoryAddress:addr];
    return res;
}

@end
