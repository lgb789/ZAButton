//
//  ZAViewController.m
//  ZAButton
//
//  Created by lgb789 on 05/03/2018.
//  Copyright (c) 2018 lgb789. All rights reserved.
//

#import "ZAViewController.h"
#import "CustomView.h"

@interface ZAViewController ()
@property (nonatomic, strong) CustomView *customView;
@end

@implementation ZAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.customView = [[CustomView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.customView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
