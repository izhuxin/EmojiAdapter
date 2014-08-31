//
//  NSString+Emoji.m
//  Myproject
//
//  Created by Jeason on 14-8-11.
//  Copyright (c) 2014年 Myproject. All rights reserved.
//

#import "NSString+Emoji.h"
#import "Emoji.h"

#define EmojiBegin 0x02
#define EmojiEnd   0x03

@implementation NSString (Emoji)

-(NSString *)decodeString {
    __block BOOL isEmojiBegin = false;
    __block NSString *emojiFileName = @"";      //temp var to store the file name
    __block NSMutableString *result = [NSMutableString stringWithString:@""];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences //setperate as composed character
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const char *utf8Str = [substring UTF8String];
                                char aChar = [substring characterAtIndex:0]; //a unicode substr's length is 2
                                if ( aChar == EmojiBegin && strlen(utf8Str) == 1 ) { //卧槽，句号的unicode编码刚好第一个字符就是0x02
                                    isEmojiBegin = YES;
                                } else if ( aChar == EmojiEnd && strlen(utf8Str) == 1 ) {   //if it is in end
                                    isEmojiBegin = NO;
                                    NSString *emoji = [emojiFileName decodeEmojiString];    //decode the filename
                                    if ( emoji != nil ) {   //if decode succ
                                        [result appendString:emoji];    //add to result
                                    }
                                    emojiFileName = @"";    //clear file name
                                } else {
                                    if ( isEmojiBegin ) {   //the next substring is part of filename
                                        emojiFileName = [emojiFileName stringByAppendingString:substring];
                                    } else {    //the next substring is the normal string
                                        [result appendString:substring];
                                    }
                                }
                            }];
    
    return [NSString stringWithString:result];
}

/**
 *  Decode a single file name to emoji string
 *
 *  @return the decode emoji string
 */
- (NSString *)decodeEmojiString {
    NSString *plistName;
    if ( [self length] >= 3 ) { //if the filename is valid
        if ( [self characterAtIndex:0] == 'f' ) {
            if ( [self characterAtIndex:1] == 'l' ) {
                //flower
                plistName = @"EmojiFlower";
            } else {
                //face
                plistName = @"EmojiFace";
            }
        } else if ( [self characterAtIndex:0] == 's' ) {
            if ( [self characterAtIndex:1] == 't' ) {
                //status
                plistName = @"EmojiStatus";
            } else {
                //symbol
                plistName = @"EmojiSymbol";
            }
        } else if ( [self characterAtIndex:0] == 'm' ) {
            //meal
            plistName = @"EmojiMeal";
        }
        NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        NSDictionary *decodeDict = [[NSDictionary alloc] initWithContentsOfFile:filePath];//read the plist file
        NSInteger emojiCode = [[decodeDict objectForKey:self] intValue];
        return [Emoji emojiWithCode:emojiCode];
    } else {
        return @"";
    }
}

+ (NSDictionary *)encodeDictionary {
    NSArray *plistNames = @[@"ToEmojiFace", @"ToEmojiFlower", @"ToEmojiStatus", @"ToEmojiSymbol", @"ToEmojiMeal"];
    NSMutableDictionary *toEmojiDict = [NSMutableDictionary dictionary];
    for (NSString *pName in plistNames) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:pName ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        [toEmojiDict addEntriesFromDictionary:dict];
    }
    return toEmojiDict;
}

- (NSString *)encodeString {
    
    NSDictionary *toEmojiDict = [NSString encodeDictionary];
    
    __block NSMutableString *result = [NSMutableString stringWithString:@""];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              NSString *encodeStr = toEmojiDict[substring];
                              encodeStr = encodeStr == nil ? substring : [encodeStr encodeEmojiString];
                              [result appendString:encodeStr];
                          }];
    
    return [NSString stringWithString:result];
}

/**
 *  Encode emoji string with a prefix and a postfix
 *
 *  @return the encoded emoji string
 */
-(NSString *)encodeEmojiString {
    return [NSString stringWithFormat:@"%c%@%c",EmojiBegin, self, EmojiEnd];
}

@end
