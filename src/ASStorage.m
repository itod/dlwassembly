//
//  ASStorage.m
//  Assembly
//
//  Created by Todd Ditchendorf on 2/24/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <DLWAssembly/ASStorage.h>
#import <DLWAssembly/ASUtils.h>

@interface ASStorage ()
- (void)setDword:(ASDword)dword atIndex:(ASIndex)idx;
@property (nonatomic, assign, readwrite) ASSize numBytes;
@end

@implementation ASStorage  {
    ASDword _dword;
}


+ (instancetype)storageWithByte:(ASByte)byte { return [[[self alloc] initWithByte:byte] autorelease]; }
+ (instancetype)storageWithWord:(ASWord)word { return [[[self alloc] initWithWord:word] autorelease]; }
+ (instancetype)storageWithDword:(ASDword)dword { return [[[self alloc] initWithDword:dword] autorelease]; }


- (instancetype)initWithByte:(ASByte)byte {
    return [self initWithDword:byte numBytes:1];
}


- (instancetype)initWithWord:(ASWord)word {
    return [self initWithDword:word numBytes:2];
}


- (instancetype)initWithDword:(ASDword)dword {
    return [self initWithDword:dword numBytes:4];
}


- (instancetype)initWithDword:(ASDword)dword numBytes:(ASSize)numBytes {
    self = [super init];
    if (self) {
        self.numBytes = numBytes;
        [self setDword:dword atIndex:0];
    }
    return self;
}


- (NSString *)asDecimalString {
    NSString *str = [NSString stringWithFormat:@"%d", self.integerValue];
    return str;
}


- (NSString *)asHexString {
    NSString *str = ASHexStringFromDword(self.dwordValue);
    return str;
}


- (NSString *)asBinaryString {
    return ASBinaryStringFromDword(self.dwordValue);
}


- (ASByte)byteAtIndex:(ASIndex)idx {
    NSParameterAssert(idx < 4);
    
    ASSize bitOffset = idx * 8;
    
    ASDword res = self.dwordValue >> bitOffset;
    res &= 0x000000FF;
    
    return res;
}


- (ASWord)wordAtIndex:(ASIndex)idx {
    NSParameterAssert(idx < 2);
    
    ASSize bitOffset = idx * 16;
    
    ASDword res = self.dwordValue >> bitOffset;
    res &= 0x0000FFFF;
    
    return res;
}


- (ASDword)dwordAtIndex:(ASIndex)idx {
    NSParameterAssert(0 == idx);
    TDAssertMainThread();
    
    return _dword;
}


- (void)setDword:(ASDword)dword atIndex:(ASIndex)idx {
    NSParameterAssert(0 == idx);
    TDAssertMainThread();
    
    _dword = dword;
}


- (BOOL)boolForBitAtIndex:(ASIndex)idx {
    ASDword mask = (1 << idx);
    ASDword dword = self.dwordValue;
    ASDword result = (dword & mask);
    return result > 0;
}


- (ASByte)byteValue {
    return [self byteAtIndex:0];
}


- (ASWord)wordValue {
    return [self wordAtIndex:0];
}


- (ASDword)dwordValue {
    return [self dwordAtIndex:0];
}


- (ASInteger)integerValue {
    ASInteger i = [self dwordAtIndex:0];
    return i;
}


- (NSString *)stringValue {
    return [self asHexString];
}

@end
