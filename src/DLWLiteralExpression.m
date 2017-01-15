//
//  DLWLiteralExpression.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWLiteralExpression.h"

@implementation DLWLiteralExpression

- (ASWord)evaluateInContext:(DLWContext *)ctx {
    return (ASWord)self.token.doubleValue;
}

@end
