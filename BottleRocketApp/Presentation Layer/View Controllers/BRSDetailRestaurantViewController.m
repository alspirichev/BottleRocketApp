//
//  BRSDetailRestaurantViewController.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSDetailRestaurantViewController.h"
#import <MapKit/MapKit.h>

static NSString * const MAP_ANNOTATION_IDENTIFIER = @"RestaurantMapIdentifier";

@interface BRSDetailRestaurantViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UILabel *categoryType;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterNameLabel;

@end

@implementation BRSDetailRestaurantViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupDetailRestaurantViewControllerFromRestaurant:self.restaurant];
}

- (void)setupDetailRestaurantViewControllerFromRestaurant:(BRSRestaurant *)restaurant
{
	[self.mapView addAnnotation:self.restaurant];
	[self.mapView showAnnotations:self.mapView.annotations animated:NO];
	self.restaurantName.text = restaurant.name;
	self.categoryType.text = restaurant.category;
	self.addressLabel.text = restaurant.location.address;
	self.cityLabel.text = restaurant.location.fullAddress;
	self.phoneLabel.text = restaurant.contact.formattedPhone;
	self.twitterNameLabel.text = restaurant.contact.twitter;
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	if (annotation == self.restaurant)
	{
		MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:MAP_ANNOTATION_IDENTIFIER];
		if (!view)
		{
			view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MAP_ANNOTATION_IDENTIFIER];
			view.canShowCallout = YES;
		}
		return view;
	}
	return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	if (view.annotation == self.restaurant)
	{
		MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.restaurant.coordinate addressDictionary:nil];
		MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
		mapItem.name = self.restaurant.name;
		[mapItem openInMapsWithLaunchOptions:@{ MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving }];
	}
}

@end
