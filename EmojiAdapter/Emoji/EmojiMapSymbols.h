//
//  EmojiMapSymbols.h
//  Myproject
//
//  Created by JInbo on 13-12-23.
//  Copyright (c) 2013年 Myproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Emoji.h"

@interface EmojiMapSymbols : NSObject

+ (NSArray *)allMapSymbolsInDict:(NSDictionary *)dict;

EMOJI_HMETHOD(horizontalTrafficLight);
EMOJI_HMETHOD(verticalTrafficLight);
EMOJI_HMETHOD(constructionSign);
EMOJI_HMETHOD(policeCarsRevolvingLight);
EMOJI_HMETHOD(triangularFlagOnPost);
EMOJI_HMETHOD(door);
EMOJI_HMETHOD(noEntrySign);
EMOJI_HMETHOD(smokingSymbol);
EMOJI_HMETHOD(noSmokingSymbol);
EMOJI_HMETHOD(putLitterInItsPlaceSymbol);
EMOJI_HMETHOD(doNotLitterSymbol);
EMOJI_HMETHOD(potableWaterSymbol);
EMOJI_HMETHOD(nonPotableWaterSymbol);
EMOJI_HMETHOD(bicycle);
EMOJI_HMETHOD(noBicycles);
EMOJI_HMETHOD(bicyclist);
EMOJI_HMETHOD(mountainBicyclist);
EMOJI_HMETHOD(pedestrian);
EMOJI_HMETHOD(noPedestrians);
EMOJI_HMETHOD(childrenCrossing);
EMOJI_HMETHOD(mensSymbol);
EMOJI_HMETHOD(womensSymbol);
EMOJI_HMETHOD(restroom);
EMOJI_HMETHOD(babySymbol);
EMOJI_HMETHOD(toilet);
EMOJI_HMETHOD(waterCloset);
EMOJI_HMETHOD(shower);
EMOJI_HMETHOD(bath);
EMOJI_HMETHOD(bathtub);
EMOJI_HMETHOD(passportControl);
EMOJI_HMETHOD(customs);
EMOJI_HMETHOD(baggageClaim);
EMOJI_HMETHOD(leftLuggage);
@end
