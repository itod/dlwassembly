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

- (ASByte)valueForMemoryAddress:(ASIndex)addr;
- (void)setValue:(ASByte)val forMemoryAddress:(ASIndex)addr;

@property (nonatomic, assign) ASByte registerA;
@property (nonatomic, assign) ASByte registerB;
@property (nonatomic, assign) ASByte registerC;
@property (nonatomic, assign) ASByte registerD;

@property (nonatomic, retain) ASMutableStorage *processorStatus;
@property (nonatomic, assign, getter=isStatusZero) BOOL statusZero;
@property (nonatomic, assign, getter=isStatusOverflow) BOOL statusOverflow;
@property (nonatomic, assign, getter=isStatusNegative) BOOL statusNegative;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
