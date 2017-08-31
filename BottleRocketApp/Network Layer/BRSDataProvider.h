//
//  BRSDataProvider.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRSRestaurant.h"

@interface BRSDataProvider : NSObject

- (void)getRestaurants:(nonnull void (^)(NSArray<BRSRestaurant *> * _Nullable restaurants))success
			   failure:(nonnull void (^)(NSHTTPURLResponse * _Nullable response, NSError * _Nullable error))failure;

@end
