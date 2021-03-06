//
//  ASDestination.h
//  Assembly
//
//  Created by Todd Ditchendorf on 2/23/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <DLWAssembly/ASStorage.h>

@interface ASMutableStorage : ASStorage

- (void)setByte:(ASByte)byte atByteIndex:(ASIndex)idx;
- (void)setValue:(ASWord)word atByteIndex:(ASIndex)idx;
- (void)setDword:(ASDword)dword atByteIndex:(ASIndex)idx;

- (void)setNybble:(ASByte)byte atBitIndex:(ASIndex)idx;
- (void)setNybblet:(ASByte)byte atBitIndex:(ASIndex)idx;
- (void)setBool:(BOOL)yn atBitIndex:(ASIndex)idx;

@property (nonatomic, assign, readwrite) ASByte byteValue;
@property (nonatomic, assign, readwrite) ASWord wordValue;
@property (nonatomic, assign, readwrite) ASDword dwordValue;
@property (nonatomic, assign, readwrite) ASInteger integerValue;
@property (nonatomic, assign, readwrite) ASLong longValue;

@property (nonatomic, copy, readonly) NSString *stringValue;
@end
