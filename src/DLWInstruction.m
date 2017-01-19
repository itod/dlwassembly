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

@class DLWContext;

@implementation DLWInstruction

- (ASWord)byteCode {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return 0;
}


- (ASByte)opCode {
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

- (ASByte)opCode { return 0; }


- (BOOL)isImmediate {
    return [self.children[0] isLiteral] || [self.children[1] isLiteral];
}


- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(3 == [self.children count]);
    ASWord arg0 = [self.children[0] evaluateInContext:ctx];
    ASWord arg1 = [self.children[1] evaluateInContext:ctx];
    
    ASWord res = arg0 + arg1;
    
    DLWDestination *dest = self.children[2];
    [dest setWord:res inContext:ctx];
}

@end

@implementation DLWSubInstruction

- (ASByte)opCode { return 1; }


- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(3 == [self.children count]);
    ASWord arg0 = [self.children[0] evaluateInContext:ctx];
    ASWord arg1 = [self.children[1] evaluateInContext:ctx];
    
    ASWord res = arg0 - arg1;
    
    DLWDestination *dest = self.children[2];
    [dest setWord:res inContext:ctx];
}

@end

@implementation DLWLoadInstruction

- (ASByte)opCode { return 3; }


- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(2 == [self.children count]);
    ASWord val = [self.children[0] evaluateInContext:ctx];
    DLWDestination *dest = self.children[1];
    
    [dest setWord:val inContext:ctx];
}

@end

@implementation DLWStoreInstruction

- (ASByte)opCode { return 4; }

@end

@implementation DLWJumpInstruction

- (ASByte)opCode { return 5; }

@end

@implementation DLWJumpzInstruction

- (ASByte)opCode { return 6; }

@end

@implementation DLWJumpnInstruction

- (ASByte)opCode { return 7; }

@end

@implementation DLWJumpoInstruction

- (ASByte)opCode { return 8; }

@end

