//
//  BRSLocation.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSLocation.h"

@implementation BRSLocation

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
	self.address = [dictionary valueForKey:@"address"];
	self.latitude = [[dictionary valueForKey:@"lat"] doubleValue];
	self.longitude = [[dictionary valueForKey:@"lng"] doubleValue];
	self.postalCode = [dictionary valueForKey:@"postalCode"];
	self.countryCode = [dictionary valueForKey:@"cc"];
	self.city = [dictionary valueForKey:@"city"];
	self.state = [dictionary valueForKey:@"state"];
	self.country = [dictionary valueForKey:@"country"];
	self.formattedAddress = [dictionary valueForKey:@"formattedAddress"];

	return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
	return @{
			 @"address": @"address",
			 @"latitude": @"lat",
			 @"longitude": @"lng",
			 @"postalCode": @"postalCode",
			 @"countryCode": @"cc",
			 @"city": @"city",
			 @"state": @"state",
			 @"country": @"country",
			 @"formattedAddress": @"formattedAddress"
			 };
}

- (CLLocationCoordinate2D)coordinate
{
	return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)fullAddress
{
	return [NSString stringWithFormat:@"%@, %@ %@", self.city, self.state, self.postalCode];
}

@end
