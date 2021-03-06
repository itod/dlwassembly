//
//  DLWInstruction.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWInstruction.h"
#import "DLWExpression.h"
#import "DLWDestination.h"
#import <DLWAssembly/ASMutableStorage.h>
#import <DLWAssembly/DLWContext.h>

@class DLWContext;

@implementation DLWInstruction

- (ASWord)byteCode {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (ASNybble)opCode {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (BOOL)isImmediate {
    return NO;
}


- (void)executeInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWAddInstruction

- (ASNybble)opCode { return 0; }
- (ASLong)performWithLhs:(ASInteger)lhs rhs:(ASInteger)rhs { return lhs + rhs; }


- (ASWord)byteCode {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    
    // op code
    [stor setNybble:self.opCode atBitIndex:12];

    // src0
    [stor setNybblet:[(DLWExpression *)self.children[0] byteCode] atBitIndex:10];
    
    // src1
    [stor setNybblet:[(DLWExpression *)self.children[1] byteCode] atBitIndex:8];
    
    // dest
    [stor setNybblet:[(DLWExpression *)self.children[2] byteCode] atBitIndex:6];
    
    return stor.wordValue;
}


- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(3 == [self.children count]);
    ASInteger arg0 = [self.children[0] evaluateInContext:ctx];
    ASInteger arg1 = [self.children[1] evaluateInContext:ctx];
    
    ASLong l = [self performWithLhs:arg0 rhs:arg1];
    ASInteger i = (ASInteger)l;
    
    // processor status
    {
        BOOL isZero = 0 == i;
        BOOL isNeg = i < 0;
        BOOL isOver = l > 127 || l < -128;

        ctx.statusZero = isZero;
        ctx.statusOverflow = isOver;
        ctx.statusNegative = isNeg;
    }

    DLWDestination *dest = self.children[2];
    [dest setValue:i inContext:ctx];
}

@end

@implementation DLWAddImmediateInstruction

- (ASNybble)opCode { return 8; }
- (BOOL)isImmediate { return YES; }


- (ASWord)byteCode {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    
    // op code
    [stor setNybble:self.opCode atBitIndex:12];
    
    DLWExpression *src0 = self.children[0];
    DLWExpression *src1 = self.children[1];
    DLWExpression *dest = self.children[2];
    DLWExpression *litSrc = nil;
    
    // reg src
    if (src0.isLiteral) {
        [stor setNybblet:[src1 byteCode] atBitIndex:10];
        litSrc = src0;
    } else {
        [stor setNybblet:[src0 byteCode] atBitIndex:10];
        litSrc = src1;
    }
    
    // dest
    [stor setNybblet:[dest byteCode] atBitIndex:8];

    // lit src
    [stor setByte:[litSrc byteCode] atByteIndex:0];
    
    return stor.wordValue;
}

@end

@implementation DLWSubInstruction

- (ASNybble)opCode { return 1; }
- (ASLong)performWithLhs:(ASInteger)lhs rhs:(ASInteger)rhs { return lhs - rhs; }

@end

@implementation DLWSubImmediateInstruction

- (ASNybble)opCode { return 9; }
- (BOOL)isImmediate { return YES; }
- (ASLong)performWithLhs:(ASInteger)lhs rhs:(ASInteger)rhs { return lhs - rhs; }

@end

@implementation DLWLoadInstruction

- (ASNybble)opCode { return 3; }


- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(2 == [self.children count]);
    ASWord val = [self.children[0] evaluateInContext:ctx];
    DLWDestination *dest = self.children[1];
    
    [dest setValue:val inContext:ctx];
}

@end

@implementation DLWStoreInstruction

- (ASNybble)opCode { return 4; }

@end

@implementation DLWJumpInstruction

- (ASNybble)opCode { return 5; }

@end

@implementation DLWJumpzInstruction

- (ASNybble)opCode { return 6; }

@end

@implementation DLWJumpnInstruction

- (ASNybble)opCode { return 7; }

@end

@implementation DLWJumpoInstruction

- (ASNybble)opCode { return 8; }

@end

