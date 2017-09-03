//
//  BRSRestaurantsMapViewController.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 03/09/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurantsMapViewController.h"

static NSString * const MAP_ANNOTATIONS_IDENTIFIER = @"RestaurantsMapIdentifier";
static NSString * const kMapButtonIconName = @"ic_mapButton";

@interface BRSRestaurantsMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *restaurantsMapView;

@end

@implementation BRSRestaurantsMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self.restaurantsMapView addAnnotations:self.markers];
	[self.restaurantsMapView showAnnotations:self.restaurantsMapView.annotations animated:NO];
}

#pragma mark - Actions

- (IBAction)dismissViewController:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:MAP_ANNOTATIONS_IDENTIFIER];
	if (!view)
	{
		view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:MAP_ANNOTATIONS_IDENTIFIER];
		view.canShowCallout = YES;
		if (self.delegate)
		{
			UIButton *mapButton = [UIButton buttonWithType:UIButtonTypeCustom];
			[mapButton setImage:[UIImage imageNamed:kMapButtonIconName] forState:UIControlStateNormal];
			[mapButton sizeToFit];

			view.rightCalloutAccessoryView = mapButton;
		}
	}

	return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	if (self.delegate)
	{
		[self.delegate mapViewController:self didSelectMarker:view.annotation];
	}
}

@end
