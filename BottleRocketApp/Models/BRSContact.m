//
//  BRSContact.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSContact.h"

@implementation BRSContact

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [self init];
	if (self)
	{
		_phone = [dictionary valueForKey:@"phone"];
		_formattedPhone = [dictionary valueForKey:@"formattedPhone"];
		_twitter = [dictionary valueForKey:@"twitter"];
	}
	
	return self;
}

- (NSString *)twitter
{
	if (_twitter.length == 0)
	{
		return nil;
	}

	return [NSString stringWithFormat:@"@%@", _twitter];
}

@end
