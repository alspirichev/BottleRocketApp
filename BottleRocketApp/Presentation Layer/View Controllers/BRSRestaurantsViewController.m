//
//  BRSRestaurantsViewController.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSRestaurantsViewController.h"
#import "BRSDataProvider.h"
#import "BRSRestaurantCollectionViewCell.h"
#import "BRSDetailRestaurantViewController.h"
#import "BRSRestaurantsMapViewController.h"

static NSInteger const COLUMNS_COUNT_FOR_REGULAR = 2;
static NSInteger const COLUMNS_COUNT_FOR_COMPACT = 1;
static NSString * const showDetailRestaurantSegue = @"showDetailRestaurantViewController";
static NSString * const showRestaurantsMapSegue = @"showRestaurantsMapSegue";

@interface BRSRestaurantsViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, BRSRestaurantsMapViewControllerDelegate>

@property (nonatomic, strong) NSArray<BRSRestaurant *> *restaurants;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation BRSRestaurantsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self.collectionView registerNib:[BRSRestaurantCollectionViewCell cellNib]
		  forCellWithReuseIdentifier:[BRSRestaurantCollectionViewCell cellIdentifier]];

	__block BRSRestaurantsViewController *weakSelf = self;
	[[BRSDataProvider sharedInstance] getRestaurants:^(NSArray<BRSRestaurant *> * _Nullable restaurants) {
		[weakSelf.activityIndicator stopAnimating];
		weakSelf.restaurants = restaurants;
		[weakSelf.collectionView reloadData];
	} failure:^(NSError * _Nullable error) {
		[weakSelf.activityIndicator stopAnimating];
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooopps!"
																		message:@"There were occur some error."
																 preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *tryLaterAction = [UIAlertAction actionWithTitle:@"Try later."
																 style:UIAlertActionStyleDefault
															   handler:nil];
		[alert addAction:tryLaterAction];
		[weakSelf presentViewController:alert animated:YES completion:nil];
	}];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	[self.collectionView reloadData];
}

#pragma mark - Actions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:showDetailRestaurantSegue])
	{
		BRSDetailRestaurantViewController *detailRestaurantViewController = segue.destinationViewController;
		detailRestaurantViewController.restaurant = (BRSRestaurant *)sender;	
	}
	else if ([segue.identifier isEqualToString:showRestaurantsMapSegue])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		BRSRestaurantsMapViewController *restaurantsMapViewController = navigationController.viewControllers.firstObject;
		restaurantsMapViewController.delegate = self;
		restaurantsMapViewController.markers = self.restaurants;
	}
}

#pragma mark - BRSRestaurantsMapViewControllerDelegate

- (void)mapViewController:(BRSRestaurantsMapViewController *)restaurantsMapController didSelectMarker:(id <MKAnnotation>)marker
{
	[self dismissViewControllerAnimated:YES completion:^{
		[self performSegueWithIdentifier:showDetailRestaurantSegue sender:marker];
	}];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.restaurants.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	BRSRestaurantCollectionViewCell *cell =
	[self.collectionView dequeueReusableCellWithReuseIdentifier:[BRSRestaurantCollectionViewCell cellIdentifier]
												   forIndexPath:indexPath];
	[cell configureCellWithRestaurant:self.restaurants[indexPath.row]];

	return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSegueWithIdentifier:showDetailRestaurantSegue sender:self.restaurants[indexPath.row]];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger columnsCount =
	self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular ? COLUMNS_COUNT_FOR_REGULAR : COLUMNS_COUNT_FOR_COMPACT;
	return CGSizeMake(self.view.bounds.size.width / columnsCount, RESTAURANT_CELL_HEIGHT);
}

@end
