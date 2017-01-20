//
//  ASDestination.m
//  Assembly
//
//  Created by Todd Ditchendorf on 2/23/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <DLWAssembly/ASMutableStorage.h>
#import <DLWAssembly/ASUtils.h>

@interface ASStorage ()
- (void)setDword:(ASDword)dword atIndex:(ASIndex)idx;
@end

@implementation ASMutableStorage

- (void)setByte:(ASByte)byte atIndex:(ASIndex)idx {
    NSParameterAssert(idx < 4);

    ASSize bitOffset = idx * 8;
    
    ASDword inValue = byte;
    inValue <<= bitOffset;
    
    ASDword mask = 0xFFFFFF00 << bitOffset;
    ASDword dword = self.dwordValue;
    dword &= mask;
    dword |= inValue;
    
    self.dwordValue = dword;
}


- (void)setWord:(ASWord)word atIndex:(ASIndex)idx {
    NSParameterAssert(idx < 2);

    ASSize bitOffset = idx * 16;
    
    ASDword inValue = word;
    inValue <<= bitOffset;
    
    ASDword mask = 0xFFFF0000 << bitOffset;
    ASDword dword = self.dwordValue;
    dword &= mask;
    dword |= inValue;
    
    self.dwordValue = dword;
}


- (void)setDword:(ASDword)dword atIndex:(ASIndex)idx {
    [super setDword:dword atIndex:idx];
}


- (void)setNybble:(ASByte)byte forNybbleAtIndex:(ASIndex)idx {
    NSParameterAssert(idx < 8);
    
    ASSize bitOffset = idx * 4;
    
    ASDword inValue = byte;
    inValue <<= bitOffset;
    
    ASDword mask = 0xFFFFFFF0 << bitOffset;
    ASDword dword = self.dwordValue;
    dword &= mask;
    dword |= inValue;
    
    self.dwordValue = dword;
}


- (void)setBool:(BOOL)yn forBitAtIndex:(ASIndex)idx {
    ASByte inVal = yn;
    ASDword inMask = (inVal << idx);
    ASDword oldVal = self.dwordValue;
    ASDword newVal = oldVal | inMask;
    self.dwordValue = newVal;
}


- (void)setByteValue:(ASByte)byte {
    [self setByte:byte atIndex:0];
}


- (void)setWordValue:(ASWord)word {
    [self setWord:word atIndex:0];
}


- (void)setDwordValue:(ASDword)dword {
    [self setDword:dword atIndex:0];
}


- (void)setIntegerValue:(ASInteger)i {
    [self setDword:i atIndex:0];
}

@dynamic byteValue;
@dynamic wordValue;
@dynamic dwordValue;
@dynamic integerValue;
@dynamic stringValue;
@end
