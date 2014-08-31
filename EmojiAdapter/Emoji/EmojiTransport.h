//
//  EmojiTransport.h
//  Myproject
//
//  Created by JInbo on 13-12-23.
//  Copyright (c) 2013年 Myproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Emoji.h"

@interface EmojiTransport : NSObject

+ (NSArray *)allTransportInDict:(NSDictionary *)dict;

EMOJI_HMETHOD(rocket);
EMOJI_HMETHOD(helicopter);
EMOJI_HMETHOD(steamLocomotive);
EMOJI_HMETHOD(railwayCar);
EMOJI_HMETHOD(highSpeedTrain);
EMOJI_HMETHOD(highSpeedTrainWithBulletNose);
EMOJI_HMETHOD(train);
EMOJI_HMETHOD(metro);
EMOJI_HMETHOD(lightRail);
EMOJI_HMETHOD(station);
EMOJI_HMETHOD(tram);
EMOJI_HMETHOD(tramCar);
EMOJI_HMETHOD(bus);
EMOJI_HMETHOD(oncomingBus);
EMOJI_HMETHOD(trolleybus);
EMOJI_HMETHOD(busStop);
EMOJI_HMETHOD(minibus);
EMOJI_HMETHOD(ambulance);
EMOJI_HMETHOD(fireEngine);
EMOJI_HMETHOD(policeCar);
EMOJI_HMETHOD(oncomingPoliceCar);
EMOJI_HMETHOD(taxi);
EMOJI_HMETHOD(oncomingTaxi);
EMOJI_HMETHOD(automobile);
EMOJI_HMETHOD(oncomingAutomobile);
EMOJI_HMETHOD(recreationalVehicle);
EMOJI_HMETHOD(deliveryTruck);
EMOJI_HMETHOD(articulatedLorry);
EMOJI_HMETHOD(tractor);
EMOJI_HMETHOD(monorail);
EMOJI_HMETHOD(mountainRailway);
EMOJI_HMETHOD(suspensionRailway);
EMOJI_HMETHOD(mountainCableway);
EMOJI_HMETHOD(aerialTramway);
EMOJI_HMETHOD(ship);
EMOJI_HMETHOD(rowboat);
EMOJI_HMETHOD(speedboat);
@end
