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

static NSInteger const COLUMNS_COUNT_FOR_REGULAR = 2;
static NSInteger const COLUMNS_COUNT_FOR_COMPACT = 1;
static NSString * const showDetailRestaurantSegue = @"showDetailRestaurantViewController";

@interface BRSRestaurantsViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) BRSDataProvider *dataProvider;
@property (nonatomic, strong) NSArray<BRSRestaurant *> *restaurants;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation BRSRestaurantsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.dataProvider = [BRSDataProvider new];
	[self.collectionView registerNib:[BRSRestaurantCollectionViewCell cellNib]
		  forCellWithReuseIdentifier:[BRSRestaurantCollectionViewCell cellIdentifier]];

	__block BRSRestaurantsViewController *weakSelf = self;
	[self.dataProvider getRestaurants:^(NSArray<BRSRestaurant *> * _Nullable restaurants) {
		weakSelf.restaurants = restaurants;
		[weakSelf.collectionView reloadData];
	} failure:^(NSHTTPURLResponse * _Nullable response, NSError * _Nullable error) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooopps!"
																		message:@"There were occur some errors with a server."
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
