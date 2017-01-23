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


//- (void)testAdd_1_2_A {
//    NSString *str = @"add 1, 2, A;";
//    
//    NSArray *prog = [p parseString:str error:nil];
//    [exec _execute:prog];
//    
//    TDEquals((ASWord)3, ctx.registerA);
//}


- (void)testAdd_A_B_C {
    NSString *str = @"add A, B, C;";
    
    ctx.registerA = 10;
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    
    [exec _execute:prog];
    TDEquals((ASWord)12, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0000_0001_1000_0000", ASBinaryStringFromWord(code));
}


- (void)testAdd_A_1_C {
    NSString *str = @"add A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASWord)11, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0010_0000_0001", ASBinaryStringFromWord(code));
}


- (void)testAdd_5_B_C {
    NSString *str = @"add 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASWord)7, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1000_0110_0000_0101", ASBinaryStringFromWord(code));
}


- (void)testSub_A_B_C {
    NSString *str = @"sub A, B, C;";
    
    ctx.registerA = 10;
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDFalse([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASWord)8, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDFalse([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%0001_0001_1000_0000", ASBinaryStringFromWord(code));
}


- (void)testSub_A_1_C {
    NSString *str = @"sub A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASWord)9, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0010_0000_0001", ASBinaryStringFromWord(code));
}


- (void)testSub_5_B_C {
    NSString *str = @"sub 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    TDTrue([prog[0] isImmediate]);
    [exec _execute:prog];
    
    TDEquals((ASWord)3, ctx.registerC);
    
    DLWInstruction *instr = prog[0];
    TDTrue([instr isImmediate]);
    ASWord code = [instr byteCode];
    TDEqualObjects(@"%1001_0110_0000_0101", ASBinaryStringFromWord(code));
}


- (void)testLoad_a12_A {
    NSString *str = @"load #12, A;";
    
    ASIndex addr = 12;
    ASWord val = 47;

    [ctx setWord:val forMemoryAddress:addr];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, ctx.registerA);
}

- (void)testLoad_oD108_A {
    NSString *str = @"load #(D + 108), A;";
    
    ASIndex offset = 108;
    ASIndex addr = 12;
    ASWord val = 47;
    
    ctx.registerD = addr;
    [ctx setWord:val forMemoryAddress:(addr + offset)];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, ctx.registerA);
}


- (void)testLoad_rA_B {
    NSString *str = @"load #A, B;";
    
    ASIndex addr = 17;
    ASWord val = 3;
    
    ctx.registerA = addr;
    [ctx setWord:val forMemoryAddress:addr];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, ctx.registerB);
}


- (void)testStore_B_r42 {
    NSString *str = @"store B, #42;";
    
    ASWord val = 10;
    ASIndex addr = 42;

    ctx.registerB = val;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_C_rD {
    NSString *str = @"store C, #D;";
    
    ASWord val = 111;
    ASIndex addr = 88;
    
    ctx.registerC = val;
    ctx.registerD = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_44_rA{
    NSString *str = @"store 44, #A;";
    
    ASWord val = 44;
    ASIndex addr = 67;
    
    ctx.registerA = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, [ctx wordForMemoryAddress:addr]);
}


- (void)testStore_B_oC102_A {
    NSString *str = @"store B, #(C + 102);";
    
    ASWord val = 44;
    ASIndex addr = 67;
    ASIndex offset = 102;
    
    ctx.registerB = val;
    ctx.registerC = addr;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)val, [ctx wordForMemoryAddress:(addr + offset)]);
}

@end
