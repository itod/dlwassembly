//
//  ASStorage.h
//  Assembly
//
//  Created by Todd Ditchendorf on 2/24/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DLWAssembly/ASTypes.h>

@interface ASStorage : NSObject

+ (instancetype)storageWithByte:(ASByte)byte;
+ (instancetype)storageWithWord:(ASWord)word;
+ (instancetype)storageWithDword:(ASDword)dword;

- (instancetype)initWithByte:(ASByte)byte;
- (instancetype)initWithWord:(ASWord)word;
- (instancetype)initWithDword:(ASDword)dword;

- (NSString *)asDecimalString;
- (NSString *)asHexString;
- (NSString *)asBinaryString;

- (ASByte)byteatByteIndex:(ASIndex)idx;
- (ASWord)wordatByteIndex:(ASIndex)idx;
- (ASDword)dwordatByteIndex:(ASIndex)idx;

- (BOOL)boolAtBitIndex:(ASIndex)idx;

@property (nonatomic, assign, readonly) ASSize numBytes;

@property (nonatomic, assign, readonly) ASByte byteValue;
@property (nonatomic, assign, readonly) ASWord wordValue;
@property (nonatomic, assign, readonly) ASDword dwordValue;
@property (nonatomic, assign, readonly) ASInteger integerValue;

@property (nonatomic, copy, readonly) NSString *stringValue;
@end
