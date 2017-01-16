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
    ASWord res = [ctx wordForAddress:addr];
    return res;
}

@end
