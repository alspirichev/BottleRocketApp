//
//  BRSJSONParser.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 08/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSJSONParser.h"
#import "BRSRestaurant.h"

@implementation BRSJSONParser

+ (NSArray<BRSRestaurant *> *)parseRestaurantsWithJSON:(NSArray *)json
{
	NSMutableArray<BRSRestaurant *> *restaurants = [NSMutableArray new];

	for (NSDictionary *dict in json)
	{
		[restaurants addObject:[[BRSRestaurant alloc] initWithDictionary:dict]];
	}

	return [restaurants copy];
}

@end
