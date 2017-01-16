//
//  DSLWContext.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWContext.h>

@implementation DLWContext

- (void)dealloc {
    self.labelTable = nil;
    [super dealloc];
}


- (void)prepare {
    self.labelTable = [NSMutableDictionary dictionary];
}


- (ASWord)wordForAddress:(ASIndex)addr {
    return 0;
}


- (void)setWord:(ASWord)word forAddress:(ASIndex)addr {
    
}

@end
