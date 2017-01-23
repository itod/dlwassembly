//
//  DLWInstructionTest.m
//  DLWAssemblyTests
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWTestScaffold.h"
#import "DLWParser.h"
#import "DLWParserDelegate.h"
#import "DLWInstruction.h"
#import "DLWExpression.h"
#import "DLWDestination.h"

@interface DLWExecutor ()
- (void)_execute:(NSArray *)program;
@end

@interface DLWInstructionTest : XCTestCase
@property (retain) DLWParserDelegate *del;
@property (retain) DLWParser *p;
@property (retain) DLWContext *ctx;
@property (retain) DLWExecutor *exec;
@end

@implementation DLWInstructionTest

@synthesize del=del;
@synthesize p=p;
@synthesize ctx=ctx;
@synthesize exec=exec;

- (void)setUp {
    [super setUp];
    
    self.del = [[[DLWParserDelegate alloc] init] autorelease];
    self.p = [[[DLWParser alloc] initWithDelegate:del] autorelease];
    
    self.ctx = [[[DLWContext alloc] init] autorelease];
    self.exec = [[[DLWExecutor alloc] initWithContext:ctx] autorelease];

    [ctx setUp];
}


- (void)tearDown {
    [ctx tearDown];

    self.del = nil;
    self.p = nil;
    self.ctx = nil;
    self.exec = nil;
    
    [super tearDown];
}


- (void)testAdd_A_B_C {
    NSString *str = @"add A, B, C;";
    
    ctx.registerA = 128;
    ctx.registerB = 0;
    
    NSArray *prog = [p parseString:str error:nil];
    
    [exec _execute:prog];
    TDEquals((ASValue)128, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0000_0001_1000_0000", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_C_A_B_ZERO {
    NSString *str = @"add C, A, B;";
    
    ctx.registerC = 1;
    ctx.registerA = -1;
    
    NSArray *prog = [p parseString:str error:nil];
    
    [exec _execute:prog];
    TDEquals((ASValue)0, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0000_1000_0100_0000", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_D_A_B_NEG {
    NSString *str = @"add D, A, B;";
    
    ctx.registerD = 1;
    ctx.registerA = -2;
    
    NSArray *prog = [p parseString:str error:nil];
    
    [exec _execute:prog];
    TDEquals((ASValue)-1, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0000_1100_0100_0000", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDTrue(ctx.isStatusNegative);
}


- (void)testAdd_D_A_B_OVER {
    NSString *str = @"add D, A, B;";
    
    ctx.registerD = 128;
    ctx.registerA = 1;
    
    NSArray *prog = [p parseString:str error:nil];
    
    [exec _execute:prog];
    TDEquals((ASValue)-127, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0000_1100_0100_0000", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDTrue(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_A_1_C {
    NSString *str = @"add A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)11, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0010_0000_0001", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_B_127_C_ZERO {
    NSString *str = @"add B, 127, C;";
    
    ctx.registerB = -127;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)0, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0110_0111_1111", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_B_n127_C_ZERO {
    NSString *str = @"add B, -127, C;";
    
    ctx.registerB = 127;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)0, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0110_1000_0001", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_5_B_C {
    NSString *str = @"add 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)7, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0110_0000_0101", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testAdd_1_D_A_NEG {
    NSString *str = @"add 1, D, A;";
    
    ctx.registerD = -127;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)-126, ctx.registerA);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_1100_0000_0001", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDTrue(ctx.isStatusNegative);
}


- (void)testAdd_n127_D_A_NEG {
    NSString *str = @"add -127, D, A;";
    
    ctx.registerD = 1;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)-126, ctx.registerA);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_1100_1000_0001", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDTrue(ctx.isStatusNegative);
}


- (void)testSub_A_B_C {
    NSString *str = @"sub A, B, C;";
    
    ctx.registerA = 10;
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDFalse([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)8, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0001_0001_1000_0000", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_D_C_B_ZERO {
    NSString *str = @"sub D, C, B;";
    
    ctx.registerD = 1;
    ctx.registerC = 1;
    
    NSArray *prog = [p parseString:str error:nil];
    TDFalse([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)0, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0001_1110_0100_0000", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_D_B_A_ZERO {
    NSString *str = @"sub D, B, A;";
    
    ctx.registerD = 0;
    ctx.registerC = 0;
    
    NSArray *prog = [p parseString:str error:nil];
    TDFalse([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)0, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0001_1101_0000_0000", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_C_D_B_NEG {
    NSString *str = @"sub C, D, B;";
    
    ctx.registerC = -127;
    ctx.registerD = 0;
    
    NSArray *prog = [p parseString:str error:nil];
    TDFalse([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)-127, ctx.registerB);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0001_1011_0100_0000", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDTrue(ctx.isStatusNegative);
}


- (void)testSub_A_1_C {
    NSString *str = @"sub A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)9, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0010_0000_0001", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_A_1_C_ZERO {
    NSString *str = @"sub A, -1, C;";
    
    ctx.registerA = -1;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)0, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0010_1111_1111", ASBinaryStringFromWord(code));
    
    TDTrue(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_5_B_C {
    NSString *str = @"sub 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)3, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0110_0000_0101", ASBinaryStringFromWord(code));
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDFalse(ctx.isStatusNegative);
}


- (void)testSub_n5_B_D_NEG {
    NSString *str = @"sub -5, B, D;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASValue)-7, ctx.registerD);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0111_1111_1011", ASBinaryStringFromWord(code));
    
//    1111 -1
//    1110 -2
//    1101 -3
//    1100 -4
//    1011 -5
    
    TDFalse(ctx.isStatusZero);
    TDFalse(ctx.isStatusOverflow);
    TDTrue(ctx.isStatusNegative);
}


- (void)testLoad_a12_A {
    NSString *str = @"load #12, A;";
    
    ASIndex addr = 12;
    ASValue val = 47;

    [ctx setWord:val forMemoryAddress:addr];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, ctx.registerA);
}

- (void)testLoad_oD108_A {
    NSString *str = @"load #(D + 108), A;";
    
    ASIndex offset = 108;
    ASIndex addr = 12;
    ASValue val = 47;
    
    ctx.registerD = addr;
    [ctx setWord:val forMemoryAddress:(addr + offset)];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, ctx.registerA);
}


- (void)testLoad_rA_B {
    NSString *str = @"load #A, B;";
    
    ASIndex addr = 17;
    ASValue val = 3;
    
    ctx.registerA = addr;
    [ctx setWord:val forMemoryAddress:addr];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, ctx.registerB);
}


- (void)testStore_B_r42 {
    NSString *str = @"store B, #42;";
    
    ASValue val = 10;
    ASIndex addr = 42;

    ctx.registerB = val;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_C_rD {
    NSString *str = @"store C, #D;";
    
    ASValue val = 111;
    ASIndex addr = 88;
    
    ctx.registerC = val;
    ctx.registerD = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_44_rA{
    NSString *str = @"store 44, #A;";
    
    ASValue val = 44;
    ASIndex addr = 67;
    
    ctx.registerA = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_B_oC102_A {
    NSString *str = @"store B, #(C + 102);";
    
    ASValue val = 44;
    ASIndex addr = 67;
    ASIndex offset = 102;
    
    ctx.registerB = val;
    ctx.registerC = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASValue)val, [ctx wordForMemoryAddress:(addr + offset)]);
}

@end
