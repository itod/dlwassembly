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
- (void)executeInContext:(DLWContext *)ctx;
@end

@interface DLWAddStatement : DLWStatement

@end

@interface DLWSubStatement : DLWStatement

@end

@interface DLWLoadStatement : DLWStatement

@end

@interface DLWSaveStatement : DLWStatement

@end

@interface DLWJumpStatement : DLWStatement

@end

