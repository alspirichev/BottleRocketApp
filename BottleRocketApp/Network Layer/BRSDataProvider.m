//
//  BRSDataProvider.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSDataProvider.h"
#import "BRSDataAPIClient.h"
#import "BRSAPI.h"

@implementation BRSDataProvider

- (void)getRestaurants:(void (^)(NSArray<BRSRestaurant *> * _Nullable))success
			   failure:(void (^)(NSHTTPURLResponse * _Nullable, NSError * _Nullable))failure
{
	AFHTTPSessionManager *manager = [BRSDataAPIClient sharedClient];
	[manager GET:kRestaurants
	  parameters:nil
		progress:nil
		 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
			 NSDictionary *responseDictionary = (NSDictionary *)responseObject;
			 NSArray *data = responseDictionary[@"restaurants"];

			 if (data.count > 0)
			 {
				 NSError *error = nil;
				 NSArray<BRSRestaurant *> *restaurants = [MTLJSONAdapter modelsOfClass:[BRSRestaurant class]
																		  fromJSONArray:data
																				  error:&error];
				 if (!error)
				 {
					 success(restaurants);
				 }
				 else
				 {
					 failure((NSHTTPURLResponse *) nil, error);
				 }
			 }
			 else
			 {
				 success(nil);
			 }
		 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			 failure((NSHTTPURLResponse *) nil, error);
		 }];
}

@end
