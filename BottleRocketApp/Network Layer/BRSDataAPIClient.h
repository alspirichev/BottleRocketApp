//
//  BRSDataAPIClient.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface BRSDataAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
