//
//  FramePlayground.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "FramePlayground.h"

@implementation FramePlayground
{
    UIView * circle;
    UIView * square;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        circle = [[UIView alloc] init];
        circle.backgroundColor = [UIColor colorWithRed:0.22 green:0.69 blue:0.74 alpha:1.00];
        [self addSubview:circle];
        
        square = [[UIView alloc] init];
        square.layer.borderColor = [UIColor whiteColor].CGColor;
        square.layer.borderWidth = 6.0 / [UIScreen mainScreen].scale;
        [self addSubview:square];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat radius = MIN(self.frame.size.width, self.frame.size.height) * 0.75;
    circle.frame = CGRectMake(0, 0, radius, radius);
    circle.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    circle.layer.cornerRadius = radius / 2;
    
    CGFloat rectWidth = MIN(100, MAX(20, radius * 0.5));
    square.bounds = CGRectMake(0, 0, rectWidth, rectWidth);
    square.center = circle.center;
    square.transform = CGAffineTransformMakeRotation(self.frame.size.width / 150 * (2 * M_PI));
}

@end
