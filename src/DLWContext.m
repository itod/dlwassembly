//
//  DSLWContext.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <DLWAssembly/DLWContext.h>
#import <DLWAssembly/ASMutableStorage.h>

#define ZERO_IDX 0
#define OVER_IDX 1
#define NEG_IDX 2

@implementation DLWContext {
    ASValue *_memory;
}

- (void)dealloc {
    self.labelTable = nil;
    [super dealloc];
}


- (void)setUp {
    self.processorStatus = [ASMutableStorage storageWithByte:0];
    self.labelTable = [NSMutableDictionary dictionary];
    
    size_t count = pow(2, 8);
    _memory = calloc(count, sizeof(ASValue));
    TDAssert(_memory);
}


- (void)tearDown {
    TDAssert(_memory);
    free(_memory);

    self.labelTable = nil;
    self.processorStatus = nil;
}


- (ASValue)valueForMemoryAddress:(ASIndex)addr {
    TDAssert(_memory);
    ASValue res = _memory[addr];
    return res;
}


- (void)setValue:(ASValue)val forMemoryAddress:(ASIndex)addr {
    TDAssert(_memory);
    _memory[addr] = val;
}


- (BOOL)isStatusZero {
    TDAssert(_processorStatus);
    return [_processorStatus boolAtBitIndex:ZERO_IDX];
}


- (void)setStatusZero:(BOOL)yn {
    TDAssert(_processorStatus);
    return [_processorStatus setBool:yn atBitIndex:ZERO_IDX];
}


- (BOOL)isStatusOverflow {
    TDAssert(_processorStatus);
    return [_processorStatus boolAtBitIndex:OVER_IDX];
}


- (void)setStatusOverflow:(BOOL)yn {
    TDAssert(_processorStatus);
    return [_processorStatus setBool:yn atBitIndex:OVER_IDX];
}


- (BOOL)isStatusNegative {
    TDAssert(_processorStatus);
    return [_processorStatus boolAtBitIndex:NEG_IDX];
}


- (void)setStatusNegative:(BOOL)yn {
    TDAssert(_processorStatus);
    return [_processorStatus setBool:yn atBitIndex:NEG_IDX];
}

@end
