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

- (BOOL)isImmediate {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
    return NO;
}


- (void)executeInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWAddInstruction

- (BOOL)isImmediate {
    return [self.children[0] isKindOfClass:[DLWLiteralExpression class]] || [self.children[1] isKindOfClass:[DLWLiteralExpression class]];
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

- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(2 == [self.children count]);
    ASWord val = [self.children[0] evaluateInContext:ctx];
    DLWDestination *dest = self.children[1];
    
    [dest setWord:val inContext:ctx];
}

@end

@implementation DLWStoreInstruction

@end

@implementation DLWJumpInstruction

@end

