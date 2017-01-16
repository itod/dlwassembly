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
#import "DLWStatement.h"
#import "DLWExpression.h"
#import "DLWDestination.h"

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
    TDTrue([prog isKindOfClass:[NSArray class]]);
    TDEquals(1, [prog count]);
    
    {
        DLWStatement *stmt = prog[0];
        TDEqualObjects([stmt class], [DLWAddStatement class]);
        TDEquals(3, [stmt.children count]);
        TDEqualObjects([stmt.children[0] class], [DLWLiteralExpression class]);
        TDEqualObjects([stmt.children[1] class], [DLWLiteralExpression class]);
        TDEqualObjects([stmt.children[2] class], [DLWDestination class]);
    }
    
    {
        DLWContext *ctx = [[[DLWContext alloc] init] autorelease];
        DLWVisitor *v = [[[DLWVisitor alloc] initWithContext:ctx] autorelease];
        
        [v visit:prog];
        
        TDEquals((ASWord)3, ctx.registerA);
    }
}


- (void)testSubInstruction {
    id d = [[[DLWParserDelegate alloc] init] autorelease];
    DLWParser *p = [[[DLWParser alloc] initWithDelegate:d] autorelease];
    
    NSString *str = @"sub 2, 1, B;";
    
    NSError *err = nil;
    NSArray *prog = [p parseString:str error:&err];
    TDNil(err);
    TDNotNil(prog);
    TDTrue([prog isKindOfClass:[NSArray class]]);
    TDEquals(1, [prog count]);
    
    {
        DLWStatement *stmt = prog[0];
        TDEqualObjects([stmt class], [DLWSubStatement class]);
        TDEquals(3, [stmt.children count]);
        TDEqualObjects([stmt.children[0] class], [DLWLiteralExpression class]);
        TDEqualObjects([stmt.children[1] class], [DLWLiteralExpression class]);
        TDEqualObjects([stmt.children[2] class], [DLWDestination class]);
    }
    
    {
        DLWContext *ctx = [[[DLWContext alloc] init] autorelease];
        DLWVisitor *v = [[[DLWVisitor alloc] initWithContext:ctx] autorelease];
        
        [v visit:prog];
        
        TDEquals((ASWord)1, ctx.registerB);
    }
}

@end
