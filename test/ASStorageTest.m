//
//  ASStorageTest.m
//  DLWAssemblyTests
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWTestScaffold.h"
#import "DLWTestScaffold.h"

@interface ASStorageTest : XCTestCase

@end

@implementation ASStorageTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testByte0 {
    ASByte val = 0;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);

    TDEqualObjects(@"%0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"0", [stor asDecimalString]);
    TDEqualObjects(@"$00", [stor asHexString]);
}


- (void)testByte1 {
    ASByte val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"1", [stor asDecimalString]);
    TDEqualObjects(@"$01", [stor asHexString]);
}


- (void)testByte2 {
    ASByte val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"2", [stor asDecimalString]);
    TDEqualObjects(@"$02", [stor asHexString]);
}


- (void)testByte3 {
    ASByte val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"3", [stor asDecimalString]);
    TDEqualObjects(@"$03", [stor asHexString]);
}


- (void)testByte4 {
    ASByte val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);

    TDEqualObjects(@"%0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"4", [stor asDecimalString]);
    TDEqualObjects(@"$04", [stor asHexString]);
}


- (void)testByte5 {
    ASByte val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"5", [stor asDecimalString]);
    TDEqualObjects(@"$05", [stor asHexString]);
}


- (void)testByte6 {
    ASByte val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"6", [stor asDecimalString]);
    TDEqualObjects(@"$06", [stor asHexString]);
}


- (void)testByte7 {
    ASByte val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    TDFalse([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"7", [stor asDecimalString]);
    TDEqualObjects(@"$07", [stor asHexString]);
}


- (void)testByte8 {
    ASByte val = 8;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    TDTrue([stor boolForBitAtIndex:3]);
    
    TDEqualObjects(@"%0000_1000", [stor asBinaryString]);
    TDEqualObjects(@"8", [stor asDecimalString]);
    TDEqualObjects(@"$08", [stor asHexString]);
}



















- (void)testDword0 {
    ASDword val = 0;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"0", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0000", [stor asHexString]);
}


- (void)testDword1 {
    ASDword val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"1", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0001", [stor asHexString]);
}


- (void)testDword2 {
    ASDword val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"2", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0002", [stor asHexString]);
}


- (void)testDword3 {
    ASDword val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"3", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0003", [stor asHexString]);
}


- (void)testDword4 {
    ASDword val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"4", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0004", [stor asHexString]);
}


- (void)testDword5 {
    ASDword val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"5", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0005", [stor asHexString]);
}


- (void)testDword6 {
    ASDword val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"6", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0006", [stor asHexString]);
}


- (void)testDword7 {
    ASDword val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"7", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0007", [stor asHexString]);
}

@end
