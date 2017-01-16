//
//  DLWExecutor.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWExecutor.h>
#import <DLWAssembly/DLWContext.h>
#import "DLWStatement.h"

@interface DLWExecutor ()
@property (nonatomic, retain) DLWContext *context;
@end

@implementation DLWExecutor

- (instancetype)initWithContext:(DLWContext *)ctx {
    NSParameterAssert(ctx);
    self = [super init];
    if (self) {
        self.context = ctx;
    }
    return self;
}


- (void)dealloc {
    self.context = nil;
    [super dealloc];
}


- (void)execute:(NSArray *)program {
    NSParameterAssert(program);
    TDAssert(_context);

    [_context setUp];
    
    for (DLWStatement *stmt in program) {
        [stmt executeInContext:_context];
    }
    
    [_context tearDown];
}


- (void)_debugExecute:(NSArray *)program {
    NSParameterAssert(program);
    TDAssert(_context);
    
    for (DLWStatement *stmt in program) {
        [stmt executeInContext:_context];
    }
}

@end
