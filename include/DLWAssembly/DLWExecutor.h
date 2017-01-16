//
//  DLWExecutor.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DLWContext;

@interface DLWExecutor : NSObject

- (instancetype)initWithContext:(DLWContext *)ctx;

- (void)execute:(NSArray *)program;
@end
