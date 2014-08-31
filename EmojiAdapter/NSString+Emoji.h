//
//  NSString+Emoji.h
//  Myproject
//
//  Created by Jeason on 14-8-11.
//  Copyright (c) 2014年 Myproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emoji)

/**
 *  Encode a string contains emoji string to a string contains emoji filename.
 *  Just encode each substring to filename, if it hs no associating filename, it will return nil.
 *  @return the encoded string
 */
- (NSString *)encodeString;

/**
 *  Decode the string contains file names to String contains emoji string.
 *
 *  @return the result string
 */
- (NSString *)decodeString;

/**
 *  Generate the encode dictionary to encode an emoji string to filename
 *
 *  @return the encode dictionary
 */
+ (NSDictionary *)encodeDictionary;

@end
