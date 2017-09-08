//
//  BRSContact.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BRSContact : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *formattedPhone;
@property (nonatomic, copy) NSString *twitter;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
