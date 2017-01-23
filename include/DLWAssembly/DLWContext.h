//
//  DSLWContext.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DLWAssembly/ASTypes.h>

@class ASMutableStorage;

@interface DLWContext : NSObject

- (void)setUp;
- (void)tearDown;

- (ASValue)wordForMemoryAddress:(ASIndex)addr;
- (void)setWord:(ASValue)word forMemoryAddress:(ASIndex)addr;

@property (nonatomic, assign) ASValue registerA;
@property (nonatomic, assign) ASValue registerB;
@property (nonatomic, assign) ASValue registerC;
@property (nonatomic, assign) ASValue registerD;

@property (nonatomic, retain) ASMutableStorage *processorStatus;
@property (nonatomic, assign, getter=isStatusZero) BOOL statusZero;
@property (nonatomic, assign, getter=isStatusOverflow) BOOL statusOverflow;
@property (nonatomic, assign, getter=isStatusNegative) BOOL statusNegative;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
