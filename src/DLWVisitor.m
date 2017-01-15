//
//  DLWVisitor.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWVisitor.h>
#import <DLWAssembly/DLWContext.h>

@interface DLWVisitor ()
@property (nonatomic, retain) DLWContext *context;
@end

@implementation DLWVisitor

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


- (void)visit:(NSArray *)program {
    NSParameterAssert(program);
    TDAssert(_context);
    
}

@end
