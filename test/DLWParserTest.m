//
//  DLWParserTest.m
//  DLWAssemblyTests
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWTestScaffold.h"
#import "DLWParser.h"

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

- (void)testExample {
    DLWParser *p = [[[DLWParser alloc] initWithDelegate:nil] autorelease];
    
    NSString *str = @"add 1, 2";
    
    NSError *err = nil;
    id res = [p parseString:str error:&err];
    TDNil(err);
    TDNotNil(res);
}

@end
