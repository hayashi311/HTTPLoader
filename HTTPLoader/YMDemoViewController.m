//
//  YMDemoViewController.m
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YMDemoViewController.h"
#import "YMHTTPLoader.h"

@interface YMDemoViewController ()

- (void)sendRequest;

@end

@implementation YMDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"YMDemoViewController dealloc");
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60.f, 200.f, 200.f, 50.f);
    [button setTitle:@"押す" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)sendRequest
{
    NSURL* googleURL = [NSURL URLWithString:@"http://google.com"];
    NSURL* blogURL = [NSURL URLWithString:@"http://satoshi.blogs.com/life/2012/08/block.html"];
    
    
    NSMutableURLRequest* googleRequest = [NSURLRequest requestWithURL:googleURL];
    [YMHTTPLoader loadAsync:googleRequest
                   complete:^(NSData* data, NSError *error) {
                       if (data) {
                           // Success: process the data
                           NSLog(@"google");
                           self.title = @"google";
                       } else {
                           // Error: process the error
                           self.title = @"google Error";
                       }
                   }];
    
    
    NSMutableURLRequest* blogRequest = [NSURLRequest requestWithURL:blogURL];
    [YMHTTPLoader loadAsync:blogRequest
                   complete:^(NSData* data, NSError *error) {
                       if (data) {
                           // Success: process the data
                           NSLog(@"blog");
                           self.title = @"blog";
                       } else {
                           // Error: process the error
                           self.title = @"blog Error";
                       }
                   }];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
