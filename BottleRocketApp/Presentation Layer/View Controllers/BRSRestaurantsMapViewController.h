//
//  BRSRestaurantsMapViewController.h
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 03/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class BRSRestaurantsMapViewController;

@protocol BRSRestaurantsMapViewControllerDelegate <NSObject>

- (void)mapViewController:(BRSRestaurantsMapViewController *)restaurantsMapController didSelectMarker:(id <MKAnnotation>)marker;

@end

@interface BRSRestaurantsMapViewController : UIViewController

@property (nonatomic, strong) NSArray *markers;
@property (nonatomic, weak) id <BRSRestaurantsMapViewControllerDelegate> delegate;

@end
