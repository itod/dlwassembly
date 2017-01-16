//
//  DLWParserDelegate.m
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import "DLWParserDelegate.h"
#import <PEGKit/PEGKit.h>
#import <DLWAssembly/DLWAssembly.h>

#import "DLWStatement.h"
#import "DLWExpression.h"
#import "DLWDestination.h"

@implementation DLWParserDelegate

#pragma mark -
#pragma mark Instructions

- (void)parser:(PKParser *)p didMatchAddStmt:(PKAssembly *)a {
    DLWDestination *arg2 = [a pop];
    DLWExpression *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"add"]);
    DLWStatement *stmt = [DLWAddStatement ASTWithToken:tok];
    [stmt addChild:arg0];
    [stmt addChild:arg1];
    [stmt addChild:arg2];
    
    TDAssert(a.target);
    [a.target addObject:stmt];
}


- (void)parser:(PKParser *)p didMatchSubStmt:(PKAssembly *)a {
    DLWDestination *arg2 = [a pop];
    DLWExpression *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"sub"]);
    DLWStatement *stmt = [DLWSubStatement ASTWithToken:tok];
    [stmt addChild:arg0];
    [stmt addChild:arg1];
    [stmt addChild:arg2];
    
    TDAssert(a.target);
    [a.target addObject:stmt];
}


- (void)parser:(PKParser *)p didMatchLoadStmt:(PKAssembly *)a {
    DLWDestination *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"load"]);
    DLWStatement *stmt = [DLWLoadStatement ASTWithToken:tok];
    [stmt addChild:arg0];
    [stmt addChild:arg1];
    
    TDAssert(a.target);
    [a.target addObject:stmt];
}


- (void)parser:(PKParser *)p didMatchStoreStmt:(PKAssembly *)a {
    DLWDestination *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"store"]);
    DLWStatement *stmt = [DLWStoreStatement ASTWithToken:tok];
    [stmt addChild:arg0];
    [stmt addChild:arg1];
    
    TDAssert(a.target);
    [a.target addObject:stmt];
}


#pragma mark -
#pragma mark Expressions

- (void)parser:(PKParser *)p didMatchLitExpr:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isNumber);
    
    DLWExpression *expr = [DLWLiteralExpression ASTWithToken:tok];
    [a push:expr];
}


- (void)parser:(PKParser *)p didMatchRegExpr:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isWord);
    
    DLWExpression *expr = [DLWRegisterExpression ASTWithToken:tok];
    [a push:expr];
}


- (void)parser:(PKParser *)p didMatchAddrExpr:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isNumber);
    
    DLWExpression *addr = [DLWAddressExpression ASTWithToken:tok];
    [a push:addr];
}


- (void)parser:(PKParser *)p didMatchRefExpr:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isWord);
    
    DLWExpression *addr = [DLWIndirectionExpression ASTWithToken:tok];
    [a push:addr];
}


- (void)parser:(PKParser *)p didMatchOffsetExpr:(PKAssembly *)a {
    DLWLiteralExpression *lit = [a pop];
    TDAssert([lit isKindOfClass:[DLWLiteralExpression class]]);

    DLWRegisterExpression *reg = [a pop];
    TDAssert([reg isKindOfClass:[DLWRegisterExpression class]]);
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"("]);
    
    DLWExpression *offset = [DLWOffsetExpression ASTWithToken:tok];
    [a push:offset];
}


#pragma mark -
#pragma mark Destination

- (void)parser:(PKParser *)p didMatchRegDest:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isWord);

    DLWDestination *dest = [DLWRegisterDestination ASTWithToken:tok];
    [a push:dest];
}


- (void)parser:(PKParser *)p didMatchAddrDest:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isNumber);
    
    DLWDestination *dest = [DLWMemoryDestination ASTWithToken:tok];
    [a push:dest];
}


- (void)parser:(PKParser *)p didMatchRefDest:(PKAssembly *)a {
    PKToken *tok = [a pop];
    TDAssert(tok.isWord);
    
    DLWDestination *dest = [DLWIndirectionDestination ASTWithToken:tok];
    [a push:dest];
}

- (void)parser:(PKParser *)p didMatchOffsetDest:(PKAssembly *)a {
    DLWLiteralExpression *lit = [a pop];
    TDAssert([lit isKindOfClass:[DLWLiteralExpression class]]);
    
    DLWRegisterExpression *reg = [a pop];
    TDAssert([reg isKindOfClass:[DLWRegisterExpression class]]);
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"("]);
    
    DLWDestination *offset = [DLWOffsetDestination ASTWithToken:tok];
    [a push:offset];
}


@end
