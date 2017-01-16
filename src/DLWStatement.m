//
//  DLWStatement.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWStatement.h"

@class DLWContext;

@implementation DLWStatement

- (void)executeInContext:(DLWContext *)ctx {
    NSAssert2(0, @"%s is an abstract method and must be implemented in %@", __PRETTY_FUNCTION__, [self class]);
}

@end

@implementation DLWAddStatement

@end

@implementation DLWSubStatement

@end

@implementation DLWLoadStatement

@end

@implementation DLWSaveStatement

@end

@implementation DLWJumpStatement

@end

