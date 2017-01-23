//
//  DLWDestination.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWDestination.h"
#import "DLWParser.h"
#import "DLWExpression.h"
#import <DLWAssembly/DLWContext.h>

@implementation DLWDestination

- (ASByte)byteCode {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (void)setWord:(ASValue)word inContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWRegisterDestination

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


- (void)setWord:(ASValue)word inContext:(DLWContext *)ctx {
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

- (void)setWord:(ASValue)word inContext:(DLWContext *)ctx {
    ASIndex addr = (ASIndex)self.token.doubleValue;
    [ctx setWord:word forMemoryAddress:addr];
}

@end

@implementation DLWIndirectionDestination

- (void)setWord:(ASValue)word inContext:(DLWContext *)ctx {
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

    [ctx setWord:word forMemoryAddress:addr];
}

@end

@implementation DLWOffsetDestination

- (void)setWord:(ASValue)word inContext:(DLWContext *)ctx {
    ASIndex addr = 0;
    
    DLWExpression *reg = self.children[0];
    switch (reg.token.tokenKind) {
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
    
    DLWExpression *lit = self.children[1];
    ASIndex offset = (ASIndex)lit.token.doubleValue; // index or word?
    addr += offset;
    
    [ctx setWord:word forMemoryAddress:addr];
}

@end

