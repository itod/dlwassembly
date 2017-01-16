//
//  DLWStatement.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWStatement.h"
#import "DLWExpression.h"
#import "DLWDestination.h"

@class DLWContext;

@implementation DLWStatement

- (void)executeInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWAddStatement

- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(3 == [self.children count]);
    ASWord arg0 = [self.children[0] evaluateInContext:ctx];
    ASWord arg1 = [self.children[1] evaluateInContext:ctx];
    
    ASWord res = arg0 + arg1;
    
    DLWDestination *dest = self.children[2];
    [dest store:res inContext:ctx];
}

@end

@implementation DLWSubStatement

- (void)executeInContext:(DLWContext *)ctx {
    TDAssert(3 == [self.children count]);
    ASWord arg0 = [self.children[0] evaluateInContext:ctx];
    ASWord arg1 = [self.children[1] evaluateInContext:ctx];
    
    ASWord res = arg0 - arg1;
    
    DLWDestination *dest = self.children[2];
    [dest store:res inContext:ctx];
}

@end

@implementation DLWLoadStatement

@end

@implementation DLWSaveStatement

@end

@implementation DLWJumpStatement

@end

