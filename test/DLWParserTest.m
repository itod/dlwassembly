//
//  DLWParserTest.m
//  DLWAssemblyTests
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWTestScaffold.h"
#import "DLWParser.h"
#import "DLWParserDelegate.h"

@interface DLWParserTest : XCTestCase

@end

@implementation DLWParserTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddInstruction {
    id d = [[[DLWParserDelegate alloc] init] autorelease];
    DLWParser *p = [[[DLWParser alloc] initWithDelegate:d] autorelease];
    
    NSString *str = @"add 1, 2, A;";
    
    NSError *err = nil;
    NSArray *prog = [p parseString:str error:&err];
    TDNil(err);
    TDNotNil(prog);

//    DLWContext *ctx = [[[DLWContext alloc] init] autorelease];
//    DLWVisitor *v = [[[DLWVisitor alloc] initWithContext:ctx] autorelease];
//    
//    [v visit:prog];
//    
//    TDEquals((ASWord)3, ctx.registerA);
}

@end
