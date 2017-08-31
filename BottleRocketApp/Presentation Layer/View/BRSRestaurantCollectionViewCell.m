//
//  BRSRestaurantCollectionViewCell.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurantCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString * const cellIdentifier = @"restaurantCell";
static NSString * const cellNibName = @"BRSRestaurantsCell";

@interface BRSRestaurantCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end

@implementation BRSRestaurantCollectionViewCell

+ (NSString *)cellIdentifier
{
	return cellIdentifier;
}

+ (UINib *)cellNib
{
	return [UINib nibWithNibName:cellNibName bundle:nil];
}

- (void)configureCellWithRestaurant:(BRSRestaurant *)restaurant
{
	self.restaurantNameLabel.text = restaurant.name;
	self.categoryNameLabel.text = restaurant.category;
	[self.imageView sd_setImageWithURL:restaurant.imageURL];
}

@end
