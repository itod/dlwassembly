//
//  ASUtils.h
//  Assembly
//
//  Created by Todd Ditchendorf on 2/23/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <DLWAssembly/ASTypes.h>

extern const ASIndex ASNotFound;

extern NSString *ASHexStringFromByte(ASByte byte);
extern NSString *ASHexStringFromWord(ASWord word);
extern NSString *ASHexStringFromDword(ASDword dword);

extern NSString *ASBinaryStringFromByte(ASByte byte);
extern NSString *ASBinaryStringFromWord(ASWord word);
extern NSString *ASBinaryStringFromDword(ASDword dword);
