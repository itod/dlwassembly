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
@property (retain) DLWParserDelegate *del;
@property (retain) DLWParser *p;
@end

@implementation DLWParserTest

@synthesize del=del;
@synthesize p=p;

- (void)setUp {
    [super setUp];
    
    self.del = [[[DLWParserDelegate alloc] init] autorelease];
    self.p = [[[DLWParser alloc] initWithDelegate:del] autorelease];
    
}


- (void)tearDown {
    self.del = nil;
    self.p = nil;
    
    [super tearDown];
}


- (void)testAddInstruction {
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
        TDEqualObjects([stmt.children[2] class], [DLWRegisterDestination class]);
    }
}


- (void)testSubInstruction {
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
        TDEqualObjects([stmt.children[2] class], [DLWRegisterDestination class]);
    }
}


- (void)testLoadInstruction {
    NSString *str = @"load #12, A;";
    
    NSError *err = nil;
    NSArray *prog = [p parseString:str error:&err];
    TDNil(err);
    TDNotNil(prog);
    TDTrue([prog isKindOfClass:[NSArray class]]);
    TDEquals(1, [prog count]);
    
    {
        DLWStatement *stmt = prog[0];
        TDEqualObjects([stmt class], [DLWLoadStatement class]);
        TDEquals(2, [stmt.children count]);
        TDEqualObjects([stmt.children[0] class], [DLWAddressExpression class]);
        TDEqualObjects([stmt.children[1] class], [DLWRegisterDestination class]);
    }
}


- (void)testStoreInstruction {
    NSString *str = @"store B, #42;";
    
    NSError *err = nil;
    NSArray *prog = [p parseString:str error:&err];
    TDNil(err);
    TDNotNil(prog);
    TDTrue([prog isKindOfClass:[NSArray class]]);
    TDEquals(1, [prog count]);
    
    {
        DLWStatement *stmt = prog[0];
        TDEqualObjects([stmt class], [DLWStoreStatement class]);
        TDEquals(2, [stmt.children count]);
        TDEqualObjects([stmt.children[0] class], [DLWRegisterExpression class]);
        TDEqualObjects([stmt.children[1] class], [DLWMemoryDestination class]);
    }
}

@end
