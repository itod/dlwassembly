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
}


- (void)tearDown {
    self.del = nil;
    self.p = nil;
    self.ctx = nil;
    self.exec = nil;
    
    [super tearDown];
}


- (void)testAddInstruction {
    NSString *str = @"add 1, 2, A;";
    
    NSArray *prog = [p parseString:str error:nil];
    [exec execute:prog];
    
    TDEquals((ASWord)3, ctx.registerA);
}


- (void)testSubInstruction {
    NSString *str = @"sub 2, 1, B;";
    
    NSArray *prog = [p parseString:str error:nil];
    [exec execute:prog];
    
    TDEquals((ASWord)1, ctx.registerB);
}


- (void)testLoadInstruction {
    NSString *str = @"load #12, A;";
    
    [ctx setWord:47 forAddress:12];
    
    NSArray *prog = [p parseString:str error:nil];
    [exec execute:prog];
    
    TDEquals((ASWord)47, ctx.registerA);
}

@end
