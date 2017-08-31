//
//  UIViewController+BRSAutoratation.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "UIViewController+BRSAutoratation.h"

@implementation UIViewController (BRSAutoratation)

- (BOOL)shouldAutorotate
{
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	return [self shouldAutorotate] ? UIInterfaceOrientationMaskAll : UIInterfaceOrientationMaskPortrait;
}

@end
