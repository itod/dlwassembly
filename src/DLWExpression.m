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


- (ASByte)byteCode {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}

@end

@implementation DLWLiteralExpression

- (BOOL)isLiteral { return YES; }
- (ASSize)numBits { return 8; }
- (ASByte)byteCode { return (ASByte)self.token.doubleValue; }


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
    return (ASInteger)self.token.doubleValue;
}

@end

@implementation DLWRegisterExpression

- (ASSize)numBits { return 2; }


- (ASByte)byteCode {
    ASByte byte = 0;
    
    switch (self.token.tokenKind) {
        case DLWPARSER_TOKEN_KIND_A:
            byte = 0;
            break;
        case DLWPARSER_TOKEN_KIND_B:
            byte = 1;
            break;
        case DLWPARSER_TOKEN_KIND_C:
            byte = 2;
            break;
        case DLWPARSER_TOKEN_KIND_D:
            byte = 3;
            break;
        default:
            TDAssert(0);
            break;
    }
    
    return byte;
}


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
    ASInteger res = 0;
    
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


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
    ASIndex addr = (ASIndex)self.token.doubleValue;
    ASInteger res = [ctx valueForMemoryAddress:addr];
    return res;
}

@end

@implementation DLWIndirectionExpression

- (ASSize)numBits { return 2; }


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
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
    
    ASInteger res = [ctx valueForMemoryAddress:addr];
    return res;
}

@end

@implementation DLWOffsetExpression

- (ASSize)numBits { return 10; }


- (ASInteger)evaluateInContext:(DLWContext *)ctx {
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
    
    ASInteger res = [ctx valueForMemoryAddress:addr];
    return res;
}

@end
