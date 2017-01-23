//
//  DLWDestination.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <PEGKit/PEGKit.h>
#import <DLWAssembly/ASTypes.h>

@class DLWContext;

@interface DLWDestination : PKAST
- (ASByte)byteCode;
- (void)setValue:(ASInteger)val inContext:(DLWContext *)ctx;
@end

@interface DLWRegisterDestination : DLWDestination

@end

@interface DLWMemoryDestination : DLWDestination

@end

@interface DLWIndirectionDestination : DLWDestination

@end

@interface DLWOffsetDestination : DLWDestination

@end
