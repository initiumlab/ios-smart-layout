//
//  LayoutViewController.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "LayoutViewController.h"

@interface LayoutViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *dot1;
@property (weak, nonatomic) IBOutlet UIImageView *dot2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playgroundLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playgroundTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playgroundWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playgroundHeight;

@end

@implementation LayoutViewController

- (Class)playgroundContentViewClass
{
    return [UIView class];
}

- (instancetype)init
{
    return [super initWithNibName:NSStringFromClass([LayoutViewController class]) bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.playgroundWidth.constant = size.width * 0.75;
    self.playgroundLeading.constant = size.width * 0.25/2;
    self.playgroundHeight.constant = size.height * 0.5;
    self.playgroundTop.constant = 50;
    
    self.playground.backgroundColor = [UIColor whiteColor];
    self.playground.layer.shadowOffset = CGSizeMake(0, 5);
    self.playground.layer.shadowRadius = 10;
    self.playground.layer.shadowColor = [UIColor blackColor].CGColor;
    self.playground.layer.shadowOpacity = 0.3;
    
    self.dot1.image = [self.dot1.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.dot2.image = [self.dot2.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.dot1.userInteractionEnabled = YES;
    self.dot2.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    UIPanGestureRecognizer * pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.dot1 addGestureRecognizer:pan1];
    [self.dot2 addGestureRecognizer:pan2];
    
    // content view
    UIView * contentView = [[self.playgroundContentViewClass alloc] initWithFrame:CGRectMake(0, 0, self.playground.frame.size.width, self.playground.frame.size.height)];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.playground addSubview:contentView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan locationInView:self.view];
    CGFloat minWH = 50;
    if (pan.view == self.dot1) {
        self.playgroundWidth.constant = MAX(self.playgroundWidth.constant + self.playgroundLeading.constant - point.x, minWH);
        self.playgroundHeight.constant = MAX(self.playgroundHeight.constant + self.playgroundTop.constant - point.y, minWH);
        self.playgroundLeading.constant = point.x;
        self.playgroundTop.constant = point.y;
    } else if (pan.view == self.dot2) {
        self.playgroundWidth.constant = MAX(point.x - self.playgroundLeading.constant, minWH);
        self.playgroundHeight.constant = MAX(point.y - self.playgroundTop.constant, minWH);
    }
}

@end
