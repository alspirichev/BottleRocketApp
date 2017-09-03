//
//  BRSDataProvider.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSDataProvider.h"
#import "BRSAPI.h"

static NSString * const restaurantsKey = @"restaurants";

@implementation BRSDataProvider

+ (instancetype)sharedInstance
{
	static BRSDataProvider *sharedInstance = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[BRSDataProvider alloc] init];
	});

	return sharedInstance;
}

- (void)getRestaurants:(void (^)(NSArray<BRSRestaurant *> * _Nullable))success
			   failure:(void (^)(NSError * _Nullable))failure
{
	NSURL *url = [NSURL URLWithString:RESTAURANTS_URL];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSURLSession *session = [NSURLSession sharedSession];

	[[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (data != nil)
		{
			NSError *serializationError = nil;
			NSDictionary *restaurantsDict = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&serializationError];
			NSArray<BRSRestaurant *> *restaurants = [MTLJSONAdapter modelsOfClass:[BRSRestaurant class]
																	fromJSONArray:[restaurantsDict valueForKey:restaurantsKey]
																			error:&serializationError];
			dispatch_async(dispatch_get_main_queue(), ^{
				if (!serializationError)
				{
					success(restaurants);
				}
				else
				{
					failure(serializationError);
				}
			});
		}
		else
		{
			failure(error);
		}
	}] resume];
}

@end
