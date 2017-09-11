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
	self = [self init];
	if (self)
	{
		_address = [dictionary valueForKey:@"address"];
		_latitude = [[dictionary valueForKey:@"lat"] doubleValue];
		_longitude = [[dictionary valueForKey:@"lng"] doubleValue];
		_postalCode = [dictionary valueForKey:@"postalCode"];
		_countryCode = [dictionary valueForKey:@"cc"];
		_city = [dictionary valueForKey:@"city"];
		_state = [dictionary valueForKey:@"state"];
		_country = [dictionary valueForKey:@"country"];
		_formattedAddress = [dictionary valueForKey:@"formattedAddress"];
	}

	return self;
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
