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
#import "DLWStatement.h"
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


- (void)testAdd_1_2_A {
    NSString *str = @"add 1, 2, A;";
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)3, ctx.registerA);
}


- (void)testAdd_A_B_C {
    NSString *str = @"add A, B, C;";
    
    ctx.registerA = 10;
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)12, ctx.registerC);
}


- (void)testAdd_A_1_C {
    NSString *str = @"add A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)11, ctx.registerC);
}


- (void)testSub_2_1_B {
    NSString *str = @"sub 2, 1, B;";
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)1, ctx.registerB);
}


- (void)testSub_A_B_C {
    NSString *str = @"sub A, B, C;";
    
    ctx.registerA = 10;
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)8, ctx.registerC);
}


- (void)testAdd_5_B_C {
    NSString *str = @"add 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)7, ctx.registerC);
}


- (void)testSub_A_1_C {
    NSString *str = @"sub A, 1, C;";
    
    ctx.registerA = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)9, ctx.registerC);
}


- (void)testSub_5_B_C {
    NSString *str = @"sub 5, B, C;";
    
    ctx.registerB = 2;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)3, ctx.registerC);
}


- (void)testLoadInstruction {
    NSString *str = @"load #12, A;";

    [ctx setWord:47 forAddress:12];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)47, ctx.registerA);
}


- (void)testStoreInstruction {
    NSString *str = @"store B, #42;";
    
    ctx.registerB = 10;
    
    NSArray *prog = [p parseString:str error:nil];
    [exec _execute:prog];
    
    TDEquals((ASWord)10, [ctx wordForAddress:42]);
}

@end
