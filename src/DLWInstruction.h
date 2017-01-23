//
//  DLWInstruction.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <PEGKit/PEGKit.h>
#import <DLWAssembly/ASTypes.h>

@class DLWContext;

@interface DLWInstruction : PKAST
- (ASWord)byteCode;
- (ASByte)opCode;
- (BOOL)isImmediate;
- (void)executeInContext:(DLWContext *)ctx;
@end

@interface DLWAddInstruction : DLWInstruction

@end

@interface DLWAddImmediateInstruction : DLWAddInstruction

@end

@interface DLWSubInstruction : DLWAddInstruction

@end

@interface DLWSubImmediateInstruction : DLWAddImmediateInstruction

@end

@interface DLWLoadInstruction : DLWInstruction

@end

@interface DLWStoreInstruction : DLWLoadInstruction

@end

@interface DLWJumpInstruction : DLWInstruction

@end

@interface DLWJumpzInstruction : DLWInstruction

@end

@interface DLWJumpnInstruction : DLWInstruction

@end

@interface DLWJumpoInstruction : DLWInstruction

@end

