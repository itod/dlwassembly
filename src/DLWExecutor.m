//
//  DLWExecutor.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWExecutor.h>
#import <DLWAssembly/DLWContext.h>
#import "DLWInstruction.h"

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
    
    [self _execute:program];
    
    [_context tearDown];
}


- (void)_execute:(NSArray *)program {
    NSParameterAssert(program);
    TDAssert(_context);
    
    for (DLWInstruction *instr in program) {
        [instr executeInContext:_context];
    }
}

@end
