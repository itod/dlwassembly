//
//  DLWDestination.h
//  DLWAssembly
//
//  Created by Todd Ditchendorf on 15.01.17.
//  Copyright © 2017 Celestial Teapot. All rights reserved.
//

#import <PEGKit/PEGKit.h>
#import <DLWAssembly/DLWContext.h>

//@class DLWContext;

@interface DLWDestination : PKAST
- (void)setWord:(ASWord)word inContext:(DLWContext *)ctx;
@end
