//
//  DLWExpression.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <PEGKit/PEGKit.h>
#import <DLWAssembly/ASTypes.h>

@class DLWContext;

@interface DLWExpression : PKAST
- (BOOL)isLiteral;
- (ASSize)numBits;
- (ASWord)evaluateInContext:(DLWContext *)ctx;
@end

@interface DLWLiteralExpression : DLWExpression

@end

@interface DLWRegisterExpression : DLWExpression

@end

@interface DLWAddressExpression : DLWExpression

@end

@interface DLWIndirectionExpression : DLWExpression

@end

@interface DLWOffsetExpression : DLWExpression

@end
