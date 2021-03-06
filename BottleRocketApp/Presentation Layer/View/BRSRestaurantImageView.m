//
//  BRSRestaurantImageView.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 08/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurantImageView.h"

@interface BRSRestaurantImageView ()

@property (nonatomic, strong) NSURL *imageURL;

@end

@implementation BRSRestaurantImageView

- (void)loadImageByURL:(NSURL *)url andCacheImage:(NSCache *)imageCache
{
	self.imageURL = url;
	self.image = nil;

	if ([imageCache objectForKey:url] != nil)
	{
		self.image = (UIImage *)[imageCache objectForKey:url];
		return;
	}

	NSURLSession *session = [NSURLSession sharedSession];
	[[session dataTaskWithURL:url
			completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
				if (!error && data != nil)
				{
					dispatch_async(dispatch_get_main_queue(), ^{
						UIImage *image = [UIImage imageWithData:data];

						if (self.imageURL == url)
						{
							self.image = image;
						}

						[imageCache setObject:image forKey:url];
					});
				}
			}] resume];
}

@end
