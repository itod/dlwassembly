//
//  DSLWContext.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWContext.h>

@implementation DLWContext {
    ASWord *_storage;
}

- (void)dealloc {
    self.labelTable = nil;
    [super dealloc];
}


- (void)setUp {
    self.labelTable = [NSMutableDictionary dictionary];
    
    size_t count = pow(2, 16);
    _storage = calloc(count, sizeof(ASWord));
    TDAssert(_storage);
}


- (void)tearDown {
    TDAssert(_storage);
    free(_storage);

    self.labelTable = nil;
}


- (ASWord)wordForAddress:(ASIndex)addr {
    TDAssert(_storage);
    ASWord res = _storage[addr];
    return res;
}


- (void)setWord:(ASWord)word forAddress:(ASIndex)addr {
    TDAssert(_storage);
    _storage[addr] = word;
}

@end
