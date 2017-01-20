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
- (void)setDword:(ASDword)dword atByteIndex:(ASIndex)idx;
@end

@implementation ASMutableStorage

- (void)setByte:(ASByte)byte atByteIndex:(ASIndex)idx {
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


- (void)setWord:(ASWord)word atByteIndex:(ASIndex)idx {
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


- (void)setDword:(ASDword)dword atByteIndex:(ASIndex)idx {
    [super setDword:dword atByteIndex:idx];
}


- (void)setNybble:(ASByte)byte atBitIndex:(ASIndex)idx {
    NSParameterAssert(idx < 32);
    
    ASDword inValue = byte;
    inValue <<= idx;
    
    ASDword mask = 0xFFFFFFF0 << idx;
    ASDword dword = self.dwordValue;
    dword &= mask;
    dword |= inValue;
    
    self.dwordValue = dword;
}


- (void)setNyblet:(ASByte)byte atBitIndex:(ASIndex)idx {
    NSParameterAssert(idx < 32);
    
    ASDword inValue = byte;
    inValue <<= idx;
    
    ASDword mask = 0xFFFFFFFC << idx;
    ASDword dword = self.dwordValue;
    dword &= mask;
    dword |= inValue;
    
    self.dwordValue = dword;
}


- (void)setBool:(BOOL)yn atBitIndex:(ASIndex)idx {
    NSParameterAssert(idx < 32);
    
    ASByte inVal = yn;
    ASDword inMask = (inVal << idx);
    ASDword oldVal = self.dwordValue;
    ASDword newVal = oldVal | inMask;
    self.dwordValue = newVal;
}


- (void)setByteValue:(ASByte)byte {
    [self setByte:byte atByteIndex:0];
}


- (void)setWordValue:(ASWord)word {
    [self setWord:word atByteIndex:0];
}


- (void)setDwordValue:(ASDword)dword {
    [self setDword:dword atByteIndex:0];
}


- (void)setIntegerValue:(ASInteger)i {
    [self setDword:i atByteIndex:0];
}

@dynamic byteValue;
@dynamic wordValue;
@dynamic dwordValue;
@dynamic integerValue;
@dynamic stringValue;
@end
