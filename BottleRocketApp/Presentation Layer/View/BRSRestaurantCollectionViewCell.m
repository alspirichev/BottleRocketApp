//
//  BRSRestaurantCollectionViewCell.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurantCollectionViewCell.h"
#import "BRSRestaurantImageView.h"

static NSString * const cellIdentifier = @"restaurantCell";

@interface BRSRestaurantCollectionViewCell ()

@property (weak, nonatomic) IBOutlet BRSRestaurantImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end

@implementation BRSRestaurantCollectionViewCell

+ (NSString *)cellIdentifier
{
	return cellIdentifier;
}

- (void)configureCellWithRestaurant:(BRSRestaurant *)restaurant andCacheImage:(NSCache *)imageCache
{
	self.restaurantNameLabel.text = restaurant.name;
	self.categoryNameLabel.text = restaurant.category;
	[self.imageView loadImageByURL:restaurant.imageURL andCacheImage:imageCache];
}

@end
