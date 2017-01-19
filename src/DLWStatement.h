//
//  DLWStatement.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <PEGKit/PEGKit.h>
#import <DLWAssembly/DLWContext.h>

//@class DLWContext;

@interface DLWStatement : PKAST
- (BOOL)isImmediate;
- (void)executeInContext:(DLWContext *)ctx;
@end

@interface DLWAddStatement : DLWStatement

@end

@interface DLWSubStatement : DLWAddStatement

@end

@interface DLWLoadStatement : DLWStatement

@end

@interface DLWStoreStatement : DLWLoadStatement

@end

@interface DLWJumpStatement : DLWStatement

@end

