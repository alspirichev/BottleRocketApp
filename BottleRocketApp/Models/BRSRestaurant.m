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
	self.name = [dictionary valueForKey:@"name"];
	self.imageURL = [[NSURL alloc] initWithString:[dictionary valueForKey:@"backgroundImageURL"]];
	self.category = [dictionary valueForKey:@"category"];
	self.contact = [[BRSContact alloc] initWithDictionary:[dictionary valueForKey:@"contact"]];
	self.location = [[BRSLocation alloc] initWithDictionary:[dictionary valueForKey:@"location"]];

	return self;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{
			 @"name": @"name",
			 @"imageURL": @"backgroundImageURL",
			 @"category": @"category",
			 @"contact": @"contact",
			 @"location": @"location"
			 };
}

+ (NSValueTransformer *)contactJSONTransformer
{
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[BRSContact class]];
}

+ (NSValueTransformer *)locationJSONTransformer
{
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[BRSLocation class]];
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
