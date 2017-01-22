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

#import "DLWInstruction.h"
#import "DLWExpression.h"
#import "DLWDestination.h"

@implementation DLWParserDelegate

#pragma mark -
#pragma mark Instructions

- (void)parser:(PKParser *)p didMatchAddInstr:(PKAssembly *)a {
    DLWDestination *dest = [a pop];
    DLWExpression *src1 = [a pop];
    DLWExpression *src0 = [a pop];
    
    BOOL isSrc0Literal = [src0 isLiteral];
    BOOL isSrc1Literal = [src1 isLiteral];
    
    if (isSrc0Literal && isSrc1Literal) {
        [p raise:@"`add` instruction with `immediate` mode allows only one literal source operand."];
    }
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"add"]);
    DLWInstruction *instr = nil;
    
    if (isSrc0Literal || isSrc1Literal) {
        instr = [DLWAddImmediateInstruction ASTWithToken:tok];
    } else {
        instr = [DLWAddInstruction ASTWithToken:tok];
    }
    
    [instr addChild:src0];
    [instr addChild:src1];
    [instr addChild:dest];
    
    TDAssert(a.target);
    [a.target addObject:instr];
}


- (void)parser:(PKParser *)p didMatchSubInstr:(PKAssembly *)a {
    DLWDestination *dest = [a pop];
    DLWExpression *src1 = [a pop];
    DLWExpression *src0 = [a pop];
    
    BOOL isSrc0Literal = [src0 isLiteral];
    BOOL isSrc1Literal = [src1 isLiteral];
    
    if (isSrc0Literal && isSrc1Literal) {
        [p raise:@"`sub` instruction with `immediate` mode allows only one literal source operand."];
    }
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"sub"]);
    DLWInstruction *instr = nil;

    if (isSrc0Literal || isSrc1Literal) {
        instr = [DLWSubImmediateInstruction ASTWithToken:tok];
    } else {
        instr = [DLWSubInstruction ASTWithToken:tok];
    }
    
    [instr addChild:src0];
    [instr addChild:src1];
    [instr addChild:dest];
    
    TDAssert(a.target);
    [a.target addObject:instr];
}


- (void)parser:(PKParser *)p didMatchLoadInstr:(PKAssembly *)a {
    DLWDestination *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"load"]);
    DLWInstruction *instr = [DLWLoadInstruction ASTWithToken:tok];
    [instr addChild:arg0];
    [instr addChild:arg1];
    
    TDAssert(a.target);
    [a.target addObject:instr];
}


- (void)parser:(PKParser *)p didMatchStoreInstr:(PKAssembly *)a {
    DLWDestination *arg1 = [a pop];
    DLWExpression *arg0 = [a pop];
    
    PKToken *tok = [a pop];
    TDAssert([tok.stringValue isEqualToString:@"store"]);
    DLWInstruction *instr = [DLWStoreInstruction ASTWithToken:tok];
    [instr addChild:arg0];
    [instr addChild:arg1];
    
    TDAssert(a.target);
    [a.target addObject:instr];
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
    [offset addChild:reg];
    [offset addChild:lit];

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
    [offset addChild:reg];
    [offset addChild:lit];

    [a push:offset];
}

@end
