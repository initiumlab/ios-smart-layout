//
//  AutoResizingPlayground.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "AutoResizingPlayground.h"

@implementation AutoResizingPlayground

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = CGSizeMake(frame.size.width / 3, frame.size.height / 3);

        UIView * view1 = [[UIView alloc] initWithFrame:(CGRect){.size=size, .origin=CGPointMake(0, 0)}];
        UIView * view2 = [[UIView alloc] initWithFrame:(CGRect){.size=size, .origin=CGPointMake(size.width*2, 0)}];
        UIView * view3 = [[UIView alloc] initWithFrame:(CGRect){.size=size, .origin=CGPointMake(size.width, size.height)}];
        UIView * view4 = [[UIView alloc] initWithFrame:(CGRect){.size=size, .origin=CGPointMake(0, size.height*2)}];
        UIView * view5 = [[UIView alloc] initWithFrame:(CGRect){.size=size, .origin=CGPointMake(size.width*2, size.height*2)}];
        
        for (UIView * view in @[view1, view2, view3, view4, view5]) {
            view.backgroundColor = [UIColor blackColor];
            [self addSubview:view];
        }
        
        UIViewAutoresizing commonMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        view1.autoresizingMask = commonMask | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        view2.autoresizingMask = commonMask | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        view3.autoresizingMask = commonMask | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        view4.autoresizingMask = commonMask | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
        view5.autoresizingMask = commonMask |UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;

    }
    return self;
}

@end
