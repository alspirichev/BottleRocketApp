//
//  BRSDataAPIClient.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSDataAPIClient.h"
#import "BRSAPI.h"

@implementation BRSDataAPIClient

+ (instancetype)sharedClient
{
	static BRSDataAPIClient *_sharedClient = nil;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedClient = [[BRSDataAPIClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
		_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
	});

	return _sharedClient;
}

- (instancetype)init
{
	@throw [NSException exceptionWithName:@"You could not create an instance of this class"
								   reason:@"Please, use +(instancetype)sharedClient method"
								 userInfo:nil];
}

@end
