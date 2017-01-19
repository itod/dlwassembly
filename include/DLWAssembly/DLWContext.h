//
//  DSLWContext.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DLWAssembly/ASTypes.h>

@interface DLWContext : NSObject

- (void)setUp;
- (void)tearDown;

- (ASWord)wordForMemoryAddress:(ASIndex)addr;
- (void)setWord:(ASWord)word forMemoryAddress:(ASIndex)addr;

@property (nonatomic, assign) ASWord registerA;
@property (nonatomic, assign) ASWord registerB;
@property (nonatomic, assign) ASWord registerC;
@property (nonatomic, assign) ASWord registerD;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
