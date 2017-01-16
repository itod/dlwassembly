#import "DLWParser.h"
#import <PEGKit/PEGKit.h>


@interface DLWParser ()

@end

@implementation DLWParser { }

- (instancetype)initWithDelegate:(id)d {
    self = [super initWithDelegate:d];
    if (self) {
        
        self.startRuleName = @"prog";
        self.tokenKindTab[@"A"] = @(DLWPARSER_TOKEN_KIND_A);
        self.tokenKindTab[@"add"] = @(DLWPARSER_TOKEN_KIND_ADD);
        self.tokenKindTab[@"B"] = @(DLWPARSER_TOKEN_KIND_B);
        self.tokenKindTab[@"#"] = @(DLWPARSER_TOKEN_KIND_POUND);
        self.tokenKindTab[@";"] = @(DLWPARSER_TOKEN_KIND_SEMI_COLON);
        self.tokenKindTab[@","] = @(DLWPARSER_TOKEN_KIND_COMMA);
        self.tokenKindTab[@"C"] = @(DLWPARSER_TOKEN_KIND_C);
        self.tokenKindTab[@"jump"] = @(DLWPARSER_TOKEN_KIND_JUMP);
        self.tokenKindTab[@"D"] = @(DLWPARSER_TOKEN_KIND_D);
        self.tokenKindTab[@"+"] = @(DLWPARSER_TOKEN_KIND_PLUS);
        self.tokenKindTab[@"jumpn"] = @(DLWPARSER_TOKEN_KIND_JUMPN);
        self.tokenKindTab[@"sub"] = @(DLWPARSER_TOKEN_KIND_SUB);
        self.tokenKindTab[@"load"] = @(DLWPARSER_TOKEN_KIND_LOAD);
        self.tokenKindTab[@"jumpz"] = @(DLWPARSER_TOKEN_KIND_JUMPZ);
        self.tokenKindTab[@"("] = @(DLWPARSER_TOKEN_KIND_OPEN_PAREN);
        self.tokenKindTab[@")"] = @(DLWPARSER_TOKEN_KIND_CLOSE_PAREN);
        self.tokenKindTab[@"store"] = @(DLWPARSER_TOKEN_KIND_STORE);
        self.tokenKindTab[@"jumpo"] = @(DLWPARSER_TOKEN_KIND_JUMPO);

        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_A] = @"A";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_ADD] = @"add";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_B] = @"B";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_POUND] = @"#";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_SEMI_COLON] = @";";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_COMMA] = @",";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_C] = @"C";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_JUMP] = @"jump";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_D] = @"D";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_PLUS] = @"+";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_JUMPN] = @"jumpn";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_SUB] = @"sub";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_LOAD] = @"load";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_JUMPZ] = @"jumpz";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_OPEN_PAREN] = @"(";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_CLOSE_PAREN] = @")";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_STORE] = @"store";
        self.tokenKindNameTab[DLWPARSER_TOKEN_KIND_JUMPO] = @"jumpo";

    }
    return self;
}

- (void)dealloc {
    

    [super dealloc];
}

- (void)start {
    [self execute:^{
    
    PKTokenizer *t = self.tokenizer;

    // Number State config
    {
        t.numberState.allowsFloatingPoint = NO;
        t.numberState.allowsScientificNotation = NO;
        [t.numberState addPrefix:@"%" forRadix:2];
        [t.numberState addPrefix:@"$" forRadix:16];
    
        [t setTokenizerState:t.numberState from:'%' to:'%'];
        [t setTokenizerState:t.numberState from:'$' to:'$'];
    
        [t.numberState setFallbackState:t.symbolState from:'%' to:'%'];
        [t.numberState setFallbackState:t.symbolState from:'$' to:'$'];
    }

    self.assembly.target = [NSMutableArray array];

    }];

    [self prog_]; 
    [self matchEOF:YES]; 

}

- (void)prog_ {
    
    while ([self predicts:TOKEN_KIND_BUILTIN_ANY, 0]) {
        [self stmt_];
    }

    [self fireDelegateSelector:@selector(parser:didMatchProg:)];
}

- (void)stmt_ {
    
    if ([self predicts:DLWPARSER_TOKEN_KIND_ADD, 0]) {
        [self addStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_SUB, 0]) {
        [self subStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_LOAD, 0]) {
        [self loadStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_STORE, 0]) {
        [self storeStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_JUMP, 0]) {
        [self jumpStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_JUMPZ, 0]) {
        [self jumpzStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_JUMPN, 0]) {
        [self jumpnStmt_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_JUMPO, 0]) {
        [self jumpoStmt_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'stmt'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchStmt:)];
}

- (void)addStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_ADD discard:NO]; 
    [self mathSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self mathSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self regDest_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchAddStmt:)];
}

- (void)subStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_SUB discard:NO]; 
    [self mathSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self mathSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self regDest_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchSubStmt:)];
}

- (void)loadStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_LOAD discard:NO]; 
    [self loadSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self regDest_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchLoadStmt:)];
}

- (void)storeStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_STORE discard:NO]; 
    [self storeSrc_]; 
    [self match:DLWPARSER_TOKEN_KIND_COMMA discard:YES]; 
    [self storeDest_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchStoreStmt:)];
}

- (void)jumpStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_JUMP discard:NO]; 
    [self loc_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchJumpStmt:)];
}

- (void)jumpzStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_JUMPZ discard:NO]; 
    [self loc_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchJumpzStmt:)];
}

- (void)jumpnStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_JUMPN discard:NO]; 
    [self loc_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchJumpnStmt:)];
}

- (void)jumpoStmt_ {
    
    [self match:DLWPARSER_TOKEN_KIND_JUMPO discard:NO]; 
    [self loc_]; 
    [self match:DLWPARSER_TOKEN_KIND_SEMI_COLON discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchJumpoStmt:)];
}

- (void)mathSrc_ {
    
    if ([self predicts:TOKEN_KIND_BUILTIN_NUMBER, 0]) {
        [self litExpr_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_A, DLWPARSER_TOKEN_KIND_B, DLWPARSER_TOKEN_KIND_C, DLWPARSER_TOKEN_KIND_D, 0]) {
        [self regExpr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'mathSrc'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchMathSrc:)];
}

- (void)loadSrc_ {
    
    if ([self speculate:^{ [self litExpr_]; }]) {
        [self litExpr_]; 
    } else if ([self speculate:^{ [self addrExpr_]; }]) {
        [self addrExpr_]; 
    } else if ([self speculate:^{ [self refExpr_]; }]) {
        [self refExpr_]; 
    } else if ([self speculate:^{ [self offsetExpr_]; }]) {
        [self offsetExpr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'loadSrc'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchLoadSrc:)];
}

- (void)storeSrc_ {
    
    if ([self predicts:TOKEN_KIND_BUILTIN_NUMBER, 0]) {
        [self litExpr_]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_A, DLWPARSER_TOKEN_KIND_B, DLWPARSER_TOKEN_KIND_C, DLWPARSER_TOKEN_KIND_D, 0]) {
        [self regExpr_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'storeSrc'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchStoreSrc:)];
}

- (void)storeDest_ {
    
    if ([self speculate:^{ [self addrDest_]; }]) {
        [self addrDest_]; 
    } else if ([self speculate:^{ [self refDest_]; }]) {
        [self refDest_]; 
    } else if ([self speculate:^{ [self offsetDest_]; }]) {
        [self offsetDest_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'storeDest'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchStoreDest:)];
}

- (void)litExpr_ {
    
    [self lit_]; 

    [self fireDelegateSelector:@selector(parser:didMatchLitExpr:)];
}

- (void)regExpr_ {
    
    [self reg_]; 

    [self fireDelegateSelector:@selector(parser:didMatchRegExpr:)];
}

- (void)addrExpr_ {
    
    [self addr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchAddrExpr:)];
}

- (void)refExpr_ {
    
    [self ref_]; 

    [self fireDelegateSelector:@selector(parser:didMatchRefExpr:)];
}

- (void)offsetExpr_ {
    
    [self offset_]; 

    [self fireDelegateSelector:@selector(parser:didMatchOffsetExpr:)];
}

- (void)regDest_ {
    
    [self reg_]; 

    [self fireDelegateSelector:@selector(parser:didMatchRegDest:)];
}

- (void)addrDest_ {
    
    [self addr_]; 

    [self fireDelegateSelector:@selector(parser:didMatchAddrDest:)];
}

- (void)refDest_ {
    
    [self ref_]; 

    [self fireDelegateSelector:@selector(parser:didMatchRefDest:)];
}

- (void)offsetDest_ {
    
    [self offset_]; 

    [self fireDelegateSelector:@selector(parser:didMatchOffsetDest:)];
}

- (void)lit_ {
    
    [self matchNumber:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchLit:)];
}

- (void)reg_ {
    
    if ([self predicts:DLWPARSER_TOKEN_KIND_A, 0]) {
        [self match:DLWPARSER_TOKEN_KIND_A discard:NO]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_B, 0]) {
        [self match:DLWPARSER_TOKEN_KIND_B discard:NO]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_C, 0]) {
        [self match:DLWPARSER_TOKEN_KIND_C discard:NO]; 
    } else if ([self predicts:DLWPARSER_TOKEN_KIND_D, 0]) {
        [self match:DLWPARSER_TOKEN_KIND_D discard:NO]; 
    } else {
        [self raise:@"No viable alternative found in rule 'reg'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchReg:)];
}

- (void)addr_ {
    
    [self match:DLWPARSER_TOKEN_KIND_POUND discard:YES]; 
    [self matchNumber:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchAddr:)];
}

- (void)ref_ {
    
    [self match:DLWPARSER_TOKEN_KIND_POUND discard:YES]; 
    [self reg_]; 

    [self fireDelegateSelector:@selector(parser:didMatchRef:)];
}

- (void)offset_ {
    
    [self match:DLWPARSER_TOKEN_KIND_POUND discard:YES]; 
    [self match:DLWPARSER_TOKEN_KIND_OPEN_PAREN discard:YES]; 
    [self reg_]; 
    [self match:DLWPARSER_TOKEN_KIND_PLUS discard:YES]; 
    [self lit_]; 
    [self match:DLWPARSER_TOKEN_KIND_CLOSE_PAREN discard:YES]; 

    [self fireDelegateSelector:@selector(parser:didMatchOffset:)];
}

- (void)label_ {
    
    [self testAndThrow:(id)^{ return islower([LS(1) characterAtIndex:0]); }]; 
    [self matchWord:NO]; 

    [self fireDelegateSelector:@selector(parser:didMatchLabel:)];
}

- (void)loc_ {
    
    if ([self speculate:^{ [self label_]; }]) {
        [self label_]; 
    } else if ([self speculate:^{ [self addr_]; }]) {
        [self addr_]; 
    } else if ([self speculate:^{ [self ref_]; }]) {
        [self ref_]; 
    } else if ([self speculate:^{ [self offset_]; }]) {
        [self offset_]; 
    } else {
        [self raise:@"No viable alternative found in rule 'loc'."];
    }

    [self fireDelegateSelector:@selector(parser:didMatchLoc:)];
}

@end
