//
//  BRSLocation.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSLocation.h"

@implementation BRSLocation

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
