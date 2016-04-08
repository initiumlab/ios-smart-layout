//
//  AutoLayoutViewController.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "AutoLayoutViewController.h"
#import "AutoLayoutPlayground.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (Class)playgroundContentViewClass
{
    return [AutoLayoutPlayground class];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
