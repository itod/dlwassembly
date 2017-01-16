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


- (void)testAddInstruction:(NSString *)str {
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
        TDTrue([stmt.children[0] isKindOfClass:[DLWExpression class]]);
        TDTrue([stmt.children[1] isKindOfClass:[DLWExpression class]]);
        TDEqualObjects([stmt.children[2] class], [DLWRegisterDestination class]);
    }
    
}


- (void)testSubInstruction:(NSString *)str {
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
        TDTrue([stmt.children[0] isKindOfClass:[DLWExpression class]]);
        TDTrue([stmt.children[1] isKindOfClass:[DLWExpression class]]);
        TDEqualObjects([stmt.children[2] class], [DLWRegisterDestination class]);
    }
}


- (void)testLoadInstruction:(NSString *)str {
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
        TDTrue([stmt.children[0] isKindOfClass:[DLWExpression class]]);
        TDEqualObjects([stmt.children[1] class], [DLWRegisterDestination class]);
    }
}


- (void)testStoreInstruction:(NSString *)str {
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
        TDTrue([stmt.children[0] isKindOfClass:[DLWExpression class]]);
        TDTrue([stmt.children[1] isKindOfClass:[DLWDestination class]]);
    }
}


- (void)testAdd_1_2_A { [self testAddInstruction:@"add 1, 2, A;"]; }
- (void)testAdd_A_B_C { [self testAddInstruction:@"add A, B, C;"]; }
- (void)testAdd_A_1_C { [self testAddInstruction:@"add A, 1, C;"]; }
- (void)testAdd_5_B_C { [self testAddInstruction:@"add 5, B, C;"]; }

- (void)testSub_2_1_B { [self testSubInstruction:@"sub 2, 1, B;"]; }
- (void)testSub_A_B_C { [self testSubInstruction:@"sub A, B, C;"]; }
- (void)testSub_A_1_C { [self testSubInstruction:@"sub A, 1, C;"]; }
- (void)testSub_5_B_C { [self testSubInstruction:@"sub 5, B, C;"]; }


- (void)testLoad_12_A { [self testLoadInstruction:@"load 12, A;"]; }
- (void)testLoad_a12_A { [self testLoadInstruction:@"load #12, A;"]; }
- (void)testLoad_rA_B { [self testLoadInstruction:@"load #A, B;"]; }
- (void)testLoad_oD108_A { [self testLoadInstruction:@"load #(D + 108), A;"]; }

- (void)testStore_7_a255 { [self testStoreInstruction:@"store 7, #255;"]; }
- (void)testStore_B_a42 { [self testStoreInstruction:@"store B, #42;"]; }
- (void)testStore_C_rD { [self testStoreInstruction:@"store C, #D;"]; }
- (void)testStore_44_rA { [self testStoreInstruction:@"store 44, #A;"]; }
- (void)testStore_B_oC102_A { [self testStoreInstruction:@"store B, #(C + 102);"]; }

@end
