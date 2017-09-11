//
//  BRSRrestaurant.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurant.h"

@implementation BRSRestaurant

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
	self = [self init];
	if (self)
	{
		_name = [dictionary valueForKey:@"name"];
		_imageURL = [[NSURL alloc] initWithString:[dictionary valueForKey:@"backgroundImageURL"]];
		_category = [dictionary valueForKey:@"category"];
		_contact = [[BRSContact alloc] initWithDictionary:[dictionary valueForKey:@"contact"]];
		_location = [[BRSLocation alloc] initWithDictionary:[dictionary valueForKey:@"location"]];
	}

	return self;
}

#pragma mark - MKAnnotation

- (CLLocationCoordinate2D)coordinate
{
	return self.location.coordinate;
}

- (NSString *)title
{
	return self.name;
}

- (NSString *)subtitle
{
	return self.category;
}

@end
