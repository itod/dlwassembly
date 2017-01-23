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

- (ASWord)wordForMemoryAddress:(ASIndex)addr;
- (void)setWord:(ASWord)word forMemoryAddress:(ASIndex)addr;

@property (nonatomic, assign) ASWord registerA;
@property (nonatomic, assign) ASWord registerB;
@property (nonatomic, assign) ASWord registerC;
@property (nonatomic, assign) ASWord registerD;

@property (nonatomic, retain) ASMutableStorage *processorStatus;
@property (nonatomic, assign, getter=isStatusZero) BOOL statusZero;
@property (nonatomic, assign, getter=isStatusOverflow) BOOL statusOverflow;
@property (nonatomic, assign, getter=isStatusNegative) BOOL statusNegative;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
