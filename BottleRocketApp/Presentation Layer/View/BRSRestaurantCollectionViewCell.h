//
//  BRSRestaurantCollectionViewCell.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRSRestaurant.h"

static CGFloat const RESTAURANT_CELL_HEIGHT = 180;

@interface BRSRestaurantCollectionViewCell : UICollectionViewCell

+ (NSString *)cellIdentifier;

- (void)configureCellWithRestaurant:(BRSRestaurant *)restaurant andCacheImage:(NSCache *)imageCache;

@end
