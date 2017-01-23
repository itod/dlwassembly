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


#pragma mark -
#pragma mark Bytes

- (void)testByte0 {
    ASByte val = 0;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);

    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);

    TDEqualObjects(@"%0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"0", [stor asDecimalString]);
    TDEqualObjects(@"$00", [stor asHexString]);
}


- (void)testByte1 {
    ASByte val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"1", [stor asDecimalString]);
    TDEqualObjects(@"$01", [stor asHexString]);
}


- (void)testByte2 {
    ASByte val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"2", [stor asDecimalString]);
    TDEqualObjects(@"$02", [stor asHexString]);
}


- (void)testByte3 {
    ASByte val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDEqualObjects(@"%0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"3", [stor asDecimalString]);
    TDEqualObjects(@"$03", [stor asHexString]);
}


- (void)testByte4 {
    ASByte val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);

    TDEqualObjects(@"%0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"4", [stor asDecimalString]);
    TDEqualObjects(@"$04", [stor asHexString]);
}


- (void)testByte5 {
    ASByte val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"5", [stor asDecimalString]);
    TDEqualObjects(@"$05", [stor asHexString]);
}


- (void)testByte6 {
    ASByte val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"6", [stor asDecimalString]);
    TDEqualObjects(@"$06", [stor asHexString]);
}


- (void)testByte7 {
    ASByte val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"7", [stor asDecimalString]);
    TDEqualObjects(@"$07", [stor asHexString]);
}


- (void)testByte8 {
    ASByte val = 8;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1000", [stor asBinaryString]);
    TDEqualObjects(@"8", [stor asDecimalString]);
    TDEqualObjects(@"$08", [stor asHexString]);
}


- (void)testByte9 {
    ASByte val = 9;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1001", [stor asBinaryString]);
    TDEqualObjects(@"9", [stor asDecimalString]);
    TDEqualObjects(@"$09", [stor asHexString]);
}


- (void)testByte10 {
    ASByte val = 10;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1010", [stor asBinaryString]);
    TDEqualObjects(@"10", [stor asDecimalString]);
    TDEqualObjects(@"$0A", [stor asHexString]);
}


- (void)testByte11 {
    ASByte val = 11;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1011", [stor asBinaryString]);
    TDEqualObjects(@"11", [stor asDecimalString]);
    TDEqualObjects(@"$0B", [stor asHexString]);
}


- (void)testByte12 {
    ASByte val = 12;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1100", [stor asBinaryString]);
    TDEqualObjects(@"12", [stor asDecimalString]);
    TDEqualObjects(@"$0C", [stor asHexString]);
}


- (void)testByte13 {
    ASByte val = 13;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1101", [stor asBinaryString]);
    TDEqualObjects(@"13", [stor asDecimalString]);
    TDEqualObjects(@"$0D", [stor asHexString]);
}


- (void)testByte14 {
    ASByte val = 14;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1110", [stor asBinaryString]);
    TDEqualObjects(@"14", [stor asDecimalString]);
    TDEqualObjects(@"$0E", [stor asHexString]);
}


- (void)testByte15 {
    ASByte val = 15;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_1111", [stor asBinaryString]);
    TDEqualObjects(@"15", [stor asDecimalString]);
    TDEqualObjects(@"$0F", [stor asHexString]);
}


- (void)testByte255 {
    ASByte val = 255;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDTrue([stor boolAtBitIndex:4]);
    TDTrue([stor boolAtBitIndex:5]);
    TDTrue([stor boolAtBitIndex:6]);
    TDTrue([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%1111_1111", [stor asBinaryString]);
    TDEqualObjects(@"255", [stor asDecimalString]);
    TDEqualObjects(@"$FF", [stor asHexString]);
}

















#pragma mark -
#pragma mark DWords

- (void)testWord0 {
    ASWord val = 0;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"0", [stor asDecimalString]);
    TDEqualObjects(@"$0000", [stor asHexString]);
}


- (void)testWord1 {
    ASWord val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"1", [stor asDecimalString]);
    TDEqualObjects(@"$0001", [stor asHexString]);
}


- (void)testWord2 {
    ASWord val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"2", [stor asDecimalString]);
    TDEqualObjects(@"$0002", [stor asHexString]);
}


- (void)testWord3 {
    ASWord val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"3", [stor asDecimalString]);
    TDEqualObjects(@"$0003", [stor asHexString]);
}


- (void)testWord4 {
    ASWord val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"4", [stor asDecimalString]);
    TDEqualObjects(@"$0004", [stor asHexString]);
}


- (void)testWord5 {
    ASWord val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"5", [stor asDecimalString]);
    TDEqualObjects(@"$0005", [stor asHexString]);
}


- (void)testWord6 {
    ASWord val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"6", [stor asDecimalString]);
    TDEqualObjects(@"$0006", [stor asHexString]);
}


- (void)testWord7 {
    ASWord val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"7", [stor asDecimalString]);
    TDEqualObjects(@"$0007", [stor asHexString]);
}


- (void)testWord8 {
    ASWord val = 8;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1000", [stor asBinaryString]);
    TDEqualObjects(@"8", [stor asDecimalString]);
    TDEqualObjects(@"$0008", [stor asHexString]);
}


- (void)testWord9 {
    ASWord val = 9;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1001", [stor asBinaryString]);
    TDEqualObjects(@"9", [stor asDecimalString]);
    TDEqualObjects(@"$0009", [stor asHexString]);
}


- (void)testWord10 {
    ASWord val = 10;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1010", [stor asBinaryString]);
    TDEqualObjects(@"10", [stor asDecimalString]);
    TDEqualObjects(@"$000A", [stor asHexString]);
}


- (void)testWord11 {
    ASWord val = 11;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1011", [stor asBinaryString]);
    TDEqualObjects(@"11", [stor asDecimalString]);
    TDEqualObjects(@"$000B", [stor asHexString]);
}


- (void)testWord12 {
    ASWord val = 12;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1100", [stor asBinaryString]);
    TDEqualObjects(@"12", [stor asDecimalString]);
    TDEqualObjects(@"$000C", [stor asHexString]);
}


- (void)testWord13 {
    ASWord val = 13;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1101", [stor asBinaryString]);
    TDEqualObjects(@"13", [stor asDecimalString]);
    TDEqualObjects(@"$000D", [stor asHexString]);
}


- (void)testWord14 {
    ASWord val = 14;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1110", [stor asBinaryString]);
    TDEqualObjects(@"14", [stor asDecimalString]);
    TDEqualObjects(@"$000E", [stor asHexString]);
}


- (void)testWord15 {
    ASWord val = 15;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_1111", [stor asBinaryString]);
    TDEqualObjects(@"15", [stor asDecimalString]);
    TDEqualObjects(@"$000F", [stor asHexString]);
}


- (void)testWord255 {
    ASWord val = 255;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithWord:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDTrue([stor boolAtBitIndex:4]);
    TDTrue([stor boolAtBitIndex:5]);
    TDTrue([stor boolAtBitIndex:6]);
    TDTrue([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_1111_1111", [stor asBinaryString]);
    TDEqualObjects(@"255", [stor asDecimalString]);
    TDEqualObjects(@"$00FF", [stor asHexString]);
}






#pragma mark -
#pragma mark DWords

- (void)testDword0 {
    ASDword val = 0;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"0", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0000", [stor asHexString]);
}


- (void)testDword1 {
    ASDword val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"1", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0001", [stor asHexString]);
}


- (void)testDword2 {
    ASDword val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"2", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0002", [stor asHexString]);
}


- (void)testDword3 {
    ASDword val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"3", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0003", [stor asHexString]);
}


- (void)testDword4 {
    ASDword val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"4", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0004", [stor asHexString]);
}


- (void)testDword5 {
    ASDword val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"5", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0005", [stor asHexString]);
}


- (void)testDword6 {
    ASDword val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"6", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0006", [stor asHexString]);
}


- (void)testDword7 {
    ASDword val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDFalse([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"7", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0007", [stor asHexString]);
}


- (void)testDword8 {
    ASDword val = 8;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1000", [stor asBinaryString]);
    TDEqualObjects(@"8", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0008", [stor asHexString]);
}


- (void)testDword9 {
    ASDword val = 9;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1001", [stor asBinaryString]);
    TDEqualObjects(@"9", [stor asDecimalString]);
    TDEqualObjects(@"$0000_0009", [stor asHexString]);
}


- (void)testDword10 {
    ASDword val = 10;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1010", [stor asBinaryString]);
    TDEqualObjects(@"10", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000A", [stor asHexString]);
}


- (void)testDword11 {
    ASDword val = 11;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDFalse([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1011", [stor asBinaryString]);
    TDEqualObjects(@"11", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000B", [stor asHexString]);
}


- (void)testDword12 {
    ASDword val = 12;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1100", [stor asBinaryString]);
    TDEqualObjects(@"12", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000C", [stor asHexString]);
}


- (void)testDword13 {
    ASDword val = 13;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDFalse([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1101", [stor asBinaryString]);
    TDEqualObjects(@"13", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000D", [stor asHexString]);
}


- (void)testDword14 {
    ASDword val = 14;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDFalse([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1110", [stor asBinaryString]);
    TDEqualObjects(@"14", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000E", [stor asHexString]);
}


- (void)testDword15 {
    ASDword val = 15;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDFalse([stor boolAtBitIndex:4]);
    TDFalse([stor boolAtBitIndex:5]);
    TDFalse([stor boolAtBitIndex:6]);
    TDFalse([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_1111", [stor asBinaryString]);
    TDEqualObjects(@"15", [stor asDecimalString]);
    TDEqualObjects(@"$0000_000F", [stor asHexString]);
}


- (void)testDword255 {
    ASDword val = 255;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithDword:val];
    TDTrue([stor boolAtBitIndex:0]);
    TDTrue([stor boolAtBitIndex:1]);
    TDTrue([stor boolAtBitIndex:2]);
    TDTrue([stor boolAtBitIndex:3]);
    
    TDTrue([stor boolAtBitIndex:4]);
    TDTrue([stor boolAtBitIndex:5]);
    TDTrue([stor boolAtBitIndex:6]);
    TDTrue([stor boolAtBitIndex:7]);
    
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_1111_1111", [stor asBinaryString]);
    TDEqualObjects(@"255", [stor asDecimalString]);
    TDEqualObjects(@"$0000_00FF", [stor asHexString]);
}

@end
