//
//  YMDemoStartViewController.m
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YMDemoStartViewController.h"
#import "YMDemoViewController.h"

@interface YMDemoStartViewController ()

- (void)startDemo;

@end

@implementation YMDemoStartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60.f, 200.f, 200.f, 50.f);
    [button setTitle:@"ロード画面 >" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startDemo) forControlEvents:UIControlEventTouchUpInside];
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

- (void)startDemo
{
    YMDemoViewController* demoViewController;
    demoViewController = [[YMDemoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:demoViewController animated:YES];
}

@end
