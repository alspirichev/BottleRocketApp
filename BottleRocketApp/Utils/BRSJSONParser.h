//
//  BRSJSONParser.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 08/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BRSRestaurant;

@interface BRSJSONParser : NSObject

+ (NSArray<BRSRestaurant *> *)parseRestaurantsWithJSON:(NSArray *)json;

@end
