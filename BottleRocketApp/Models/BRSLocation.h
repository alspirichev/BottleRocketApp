//
//  BRSLocation.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <CoreLocation/CoreLocation.h>

@interface BRSLocation : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, strong) NSArray *formattedAddress;
@property (nonatomic, copy, readonly) NSString *fullAddress;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
