//
//  DLWExpression.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWExpression.h"
#import "DLWParser.h"
#import <DLWAssembly/DLWContext.h>

@implementation DLWExpression

- (BOOL)isLiteral {
    return NO;
}


- (ASSize)numBits {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (ASWord)evaluateInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}

@end

@implementation DLWLiteralExpression

- (BOOL)isLiteral { return YES; }
- (ASSize)numBits { return 8; }


- (ASWord)evaluateInContext:(DLWContext *)ctx {
    return (ASWord)self.token.doubleValue;
}

@end

@implementation DLWRegisterExpression

- (ASSize)numBits { return 2; }


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

- (ASSize)numBits { return 8; }


- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = (ASIndex)self.token.doubleValue;
    ASWord res = [ctx wordForMemoryAddress:addr];
    return res;
}

@end

@implementation DLWIndirectionExpression

- (ASSize)numBits { return 2; }


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

- (ASSize)numBits { return 10; }


- (ASWord)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = 0;
    
    DLWExpression *regExpr = self.children[0];
    TDAssert([regExpr isKindOfClass:[DLWRegisterExpression class]]);
    
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
    TDAssert([litExpr isKindOfClass:[DLWLiteralExpression class]]);

    ASIndex offset = (ASIndex)litExpr.token.doubleValue; // index or word?
    addr += offset;
    
    ASWord res = [ctx wordForMemoryAddress:addr];
    return res;
}

@end
