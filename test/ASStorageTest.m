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
    
    TDEqualObjects(@"%0000_0000", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$00", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0000", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0000", [stor asHexString]);
}


- (void)testByte1 {
    ASByte val = 1;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0001", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$01", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0001", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0001", [stor asHexString]);
}


- (void)testByte2 {
    ASByte val = 2;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0010", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$02", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0010", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0002", [stor asHexString]);
}


- (void)testByte3 {
    ASByte val = 3;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDFalse([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0011", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$03", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0011", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0003", [stor asHexString]);
}


- (void)testByte4 {
    ASByte val = 4;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);

    TDEqualObjects(@"%0000_0100", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$04", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0100", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0004", [stor asHexString]);
}


- (void)testByte5 {
    ASByte val = 5;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDFalse([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0101", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$05", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0101", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0005", [stor asHexString]);
}


- (void)testByte6 {
    ASByte val = 6;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDFalse([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0110", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$06", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0110", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0006", [stor asHexString]);
}


- (void)testByte7 {
    ASByte val = 7;
    
    ASMutableStorage *stor = [ASMutableStorage storageWithByte:val];
    TDTrue([stor boolForBitAtIndex:0]);
    TDTrue([stor boolForBitAtIndex:1]);
    TDTrue([stor boolForBitAtIndex:2]);
    
    TDEqualObjects(@"%0000_0111", ASBinaryStringFromByte(val));
    TDEqualObjects(@"$07", ASHexStringFromByte(val));
    TDEqualObjects(@"%0000_0000_0000_0000_0000_0000_0000_0111", [stor asBinaryString]);
    TDEqualObjects(@"$0000_0007", [stor asHexString]);
}

@end
