//
//  BRSWebViewController.m
//  BottleRocketApp
//
//  Created by Alexander Spirichev on 31/08/2017.
//  Copyright © 2017 Alexander Spirichev. All rights reserved.
//

#import "BRSWebViewController.h"
#import "BRSAPI.h"

@interface BRSWebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBarButtonItem;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation BRSWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setupActivityIndicator];
	NSURL *url = [NSURL URLWithString:BRS_SITE];
	[self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)setupActivityIndicator
{
	self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
	[self.activityIndicator setColor:[UIColor blackColor]];
	UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]
										   initWithCustomView:self.activityIndicator];
	[[self navigationItem] setRightBarButtonItem:rightBarButtonItem];
}

#pragma mark - Actions

- (IBAction)showPreviousPage:(id)sender
{
	[self.webView goBack];
}

- (IBAction)reloadPage:(id)sender
{
	[self.webView reload];
}

- (IBAction)showNextPage:(id)sender
{
	[self.webView goForward];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	[self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[self.activityIndicator stopAnimating];
}

@end
