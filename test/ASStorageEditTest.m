//
//  ASStorageEditTest.m
//  DLWAssemblyTests
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWTestScaffold.h"
#import "DLWTestScaffold.h"

@interface ASStorageEditTest : XCTestCase

@end

@implementation ASStorageEditTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark -
#pragma mark Bits

- (void)testByteBit0 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:0];
    TDEqualObjects(@"%0000_0001", [stor asBinaryString]);
}

- (void)testByteBit1 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:1];
    TDEqualObjects(@"%0000_0010", [stor asBinaryString]);
}

- (void)testByteBit2 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:2];
    TDEqualObjects(@"%0000_0100", [stor asBinaryString]);
}

- (void)testByteBit3 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:3];
    TDEqualObjects(@"%0000_1000", [stor asBinaryString]);
}

- (void)testByteBit4 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:4];
    TDEqualObjects(@"%0001_0000", [stor asBinaryString]);
}

- (void)testByteBit5 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:5];
    TDEqualObjects(@"%0010_0000", [stor asBinaryString]);
}

- (void)testByteBit6 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:6];
    TDEqualObjects(@"%0100_0000", [stor asBinaryString]);
}

- (void)testByteBit7 {
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:0];
    [stor setBool:1 forBitAtIndex:7];
    TDEqualObjects(@"%1000_0000", [stor asBinaryString]);
}

- (void)testWordBit0 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:0];
    TDEqualObjects(@"%0000_0000_0000_0001", [stor asBinaryString]);
}

- (void)testWordBit1 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:1];
    TDEqualObjects(@"%0000_0000_0000_0010", [stor asBinaryString]);
}

- (void)testWordBit2 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:2];
    TDEqualObjects(@"%0000_0000_0000_0100", [stor asBinaryString]);
}

- (void)testWordBit3 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:3];
    TDEqualObjects(@"%0000_0000_0000_1000", [stor asBinaryString]);
}

- (void)testWordBit4 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:4];
    TDEqualObjects(@"%0000_0000_0001_0000", [stor asBinaryString]);
}

- (void)testWordBit5 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:5];
    TDEqualObjects(@"%0000_0000_0010_0000", [stor asBinaryString]);
}

- (void)testWordBit6 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:6];
    TDEqualObjects(@"%0000_0000_0100_0000", [stor asBinaryString]);
}

- (void)testWordBit7 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setBool:1 forBitAtIndex:7];
    TDEqualObjects(@"%0000_0000_1000_0000", [stor asBinaryString]);
}

#pragma mark -
#pragma mark Nybbles

- (void)testWordNybble0 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setNybble:1 forNybbleAtIndex:0];
    TDEqualObjects(@"%0000_0000_0000_0001", [stor asBinaryString]);
}

- (void)testWordNybble1 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setNybble:1 forNybbleAtIndex:1];
    TDEqualObjects(@"%0000_0000_0001_0000", [stor asBinaryString]);
}

- (void)testWordNybble2 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setNybble:1 forNybbleAtIndex:2];
    TDEqualObjects(@"%0000_0001_0000_0000", [stor asBinaryString]);
}

- (void)testWordNybble3 {
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:0];
    [stor setNybble:1 forNybbleAtIndex:3];
    TDEqualObjects(@"%0001_0000_0000_0000", [stor asBinaryString]);
}

@end
