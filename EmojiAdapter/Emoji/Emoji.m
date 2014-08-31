//
//  Emoji.m
//  Myproject
//
//  Created by JInbo on 13-12-23.
//  Copyright (c) 2013年 Myproject. All rights reserved.
//

#import "Emoji.h"
#import "EmojiEmoticons.h"
#import "EmojiMapSymbols.h"
#import "EmojiPictographs.h"
#import "EmojiTransport.h"
#import "../NSString+Emoji.h"

@implementation Emoji
+ (NSString *)emojiWithCode:(int)code {
    int sym = EMOJI_CODE_TO_SYMBOL(code);
    return [[NSString alloc] initWithBytes:&sym length:sizeof(sym) encoding:NSUTF8StringEncoding];
}
+ (NSArray *)allEmoji {
    NSMutableArray *array = [NSMutableArray new];
    NSDictionary *dict = [NSString encodeDictionary];
    [array addObjectsFromArray:[EmojiEmoticons allEmoticonsInDict:dict]];
    [array addObjectsFromArray:[EmojiPictographs allPictographsInDict:dict]];
    [array addObjectsFromArray:[EmojiTransport allTransportInDict:dict]];
    [array addObjectsFromArray:[EmojiMapSymbols allMapSymbolsInDict:dict]];
    return array;
}
@end
