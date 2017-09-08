//
//  BRSRestaurantImageView.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 08/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRSRestaurantImageView : UIImageView

- (void)loadImageByURL:(NSURL *)url andCacheImage:(NSCache *)imageCache;

@end
