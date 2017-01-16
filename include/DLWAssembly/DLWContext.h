//
//  DSLWContext.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  uint8_t ASByte;
typedef uint16_t ASWord;
typedef uint32_t ASDword;
typedef  int32_t ASInteger;
typedef  uint8_t ASSize;
typedef uint16_t ASIndex;

@interface DLWContext : NSObject

- (void)setUp;
- (void)tearDown;

- (ASWord)wordForAddress:(ASIndex)addr;
- (void)setWord:(ASWord)word forAddress:(ASIndex)addr;

@property (nonatomic, assign) ASWord registerA;
@property (nonatomic, assign) ASWord registerB;
@property (nonatomic, assign) ASWord registerC;
@property (nonatomic, assign) ASWord registerD;

@property (nonatomic, retain) NSMutableDictionary *labelTable;
@end
