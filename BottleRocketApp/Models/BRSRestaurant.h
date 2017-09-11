//
//  BRSRrestaurant.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSContact.h"
#import "BRSLocation.h"
#import <MapKit/MapKit.h>

@interface BRSRestaurant : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) BRSContact *contact;
@property (nonatomic, strong) BRSLocation *location;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
