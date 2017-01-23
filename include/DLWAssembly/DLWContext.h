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

- (ASInteger)valueForMemoryAddress:(ASIndex)addr;
- (void)setValue:(ASInteger)val forMemoryAddress:(ASIndex)addr;

@property (nonatomic, assign) ASInteger registerA;
@property (nonatomic, assign) ASInteger registerB;
@property (nonatomic, assign) ASInteger registerC;
@property (nonatomic, assign) ASInteger registerD;

@property (nonatomic, retain) ASMutableStorage *processorStatus;
@property (nonatomic, assign, getter=isStatusZero) BOOL statusZero;
@property (nonatomic, assign, getter=isStatusOverflow) BOOL statusOverflow;
@property (nonatomic, assign, getter=isStatusNegative) BOOL statusNegative;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
