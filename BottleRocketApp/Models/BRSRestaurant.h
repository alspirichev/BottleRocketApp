//
//  BRSRrestaurant.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Mantle.h"
#import "BRSContact.h"
#import "BRSLocation.h"
#import <MapKit/MapKit.h>

@interface BRSRestaurant : MTLModel <MTLJSONSerializing, MKAnnotation>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) BRSContact *contact;
@property (nonatomic, strong) BRSLocation *location;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
