//
//  TabBarViewController.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "TabBarViewController.h"

#import "FrameViewController.h"
#import "AutoResizingViewController.h"
#import "AutoLayoutViewController.h"
#import "StackViewViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController * vc1 = [[FrameViewController alloc] init];
    UIViewController * vc2 = [[AutoResizingViewController alloc] init];
    UIViewController * vc3 = [[AutoLayoutViewController alloc] init];
    UIViewController * vc4 = [[StackViewViewController alloc] init];
    
    vc1.title = @"Frame";
    vc2.title = @"AutoResizing";
    vc3.title = @"AutoLayout";
    vc4.title = @"UIStackView";
    
    self.viewControllers = @[vc1, vc2, vc3, vc4];

    self.tabBar.tintColor = [UIColor darkGrayColor];
    for (UIViewController * vc in self.viewControllers) {
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:vc.title image:[[UIImage imageNamed:@"first"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] tag:0];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
