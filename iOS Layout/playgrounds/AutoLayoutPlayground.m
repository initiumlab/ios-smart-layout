//
//  AutoLayoutPlayground.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "AutoLayoutPlayground.h"

@implementation AutoLayoutPlayground

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        ADD_BORDER(self);
        CGFloat paddingH = 15;
        CGFloat paddingV = 10;
        
        UIView * container = [[UIView alloc] init];
        [self addSubview:container];
        container.translatesAutoresizingMaskIntoConstraints = NO;
        ALIGN(container, NSLayoutAttributeLeading, paddingH);
        ALIGN(container, NSLayoutAttributeTrailing, paddingH);
        ALIGN(container, NSLayoutAttributeTop, paddingV);
        ALIGN(container, NSLayoutAttributeBottom, paddingV);
        
        /////////////////
        //////// contents
        
        // channel
        UIView * channelLine = [[UIView alloc] init];
        channelLine.backgroundColor = [UIColor blackColor];
        [container addSubview:channelLine];
        
        UILabel * channelLabel = [[UILabel alloc] init];
        channelLabel.text = @"頻道";
        channelLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        [container addSubview:channelLabel];
        {
            channelLine.translatesAutoresizingMaskIntoConstraints = NO;
            channelLabel.translatesAutoresizingMaskIntoConstraints = NO;
            
            ALIGN(channelLine, NSLayoutAttributeLeading, 0);
            ALIGN(channelLabel, NSLayoutAttributeLeading, 0);
            [channelLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            [NSLayoutConstraint constraintWithItem:channelLine attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:channelLabel attribute:NSLayoutAttributeWidth multiplier:1 constant:0].active = YES;
            
            ALIGN(channelLine, NSLayoutAttributeTop, 0);
            [NSLayoutConstraint constraintWithItem:channelLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:channelLine attribute:NSLayoutAttributeHeight multiplier:0 constant:8.0/[UIScreen mainScreen].scale].active = YES;
            STACK(channelLine, 3, channelLabel, UILayoutConstraintAxisVertical);
            [channelLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        }
        
        
        // tag
        UIView * tagView = [[UIView alloc] init];
        ADD_BORDER(tagView);
        [container addSubview:tagView];
        {
            tagView.translatesAutoresizingMaskIntoConstraints = NO;
            ALIGN(tagView, NSLayoutAttributeTop, 0);
            ALIGN(tagView, NSLayoutAttributeTrailing, 0);
            [NSLayoutConstraint constraintWithItem:tagView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:channelLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        }
        
        UILabel * tagLabel = [[UILabel alloc] init];
        tagLabel.text = @"這是標籤";
        tagLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        [tagView addSubview:tagLabel];
        {
            tagLabel.translatesAutoresizingMaskIntoConstraints = NO;
            CGFloat paddingH = 6;
            CGFloat paddingV = 4;
            ALIGN(tagLabel, NSLayoutAttributeLeading, paddingH);
            ALIGN(tagLabel, NSLayoutAttributeTrailing, paddingH);
            ALIGN(tagLabel, NSLayoutAttributeTop, paddingV);
            ALIGN(tagLabel, NSLayoutAttributeBottom, paddingV);
        }
        
        
        // subtitle
        UILabel * subtitle = [[UILabel alloc] init];
        subtitle.numberOfLines = 2;
        subtitle.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        subtitle.text = @"比巴的異緊裡間然過去體；跑快廣話父整。故紅上有口國速後寫其必形那，境獨化的用：條統品，兩給年？";
        [container addSubview:subtitle];
        {
            subtitle.translatesAutoresizingMaskIntoConstraints = NO;
            ALIGN(subtitle, NSLayoutAttributeLeading, 0);
            ALIGN(subtitle, NSLayoutAttributeTrailing, 0);
            ALIGN(subtitle, NSLayoutAttributeBottom, 0);
            [subtitle setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        }
        
        // title
        UILabel * title = [[UILabel alloc] init];
        title.numberOfLines = 2;
        title.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize] * 1.5];
        title.text = @"點馬臺多道不了行些創緊，林我政離實河給作接策我";
        [container addSubview:title];
        {
            title.translatesAutoresizingMaskIntoConstraints = NO;
            ALIGN(title, NSLayoutAttributeLeading, 0);
            ALIGN(title, NSLayoutAttributeTrailing, 0);
            STACK(title, 10, subtitle, UILayoutConstraintAxisVertical);
            [title setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        }
        
    }
    return self;
}

static void ADD_BORDER(UIView * view) {
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 4.0 / [UIScreen mainScreen].scale;
}

static NSLayoutConstraint * ALIGN(UIView * view, NSLayoutAttribute attr, CGFloat spacing) {
    NSLayoutConstraint * constraint;
    switch (attr) {
        case NSLayoutAttributeLeft:
        case NSLayoutAttributeLeading:
        case NSLayoutAttributeTop:
            constraint = [NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:attr multiplier:1 constant:spacing];
            break;
            
        case NSLayoutAttributeRight:
        case NSLayoutAttributeTrailing:
        case NSLayoutAttributeBottom:
            constraint = [NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:attr multiplier:1 constant:-spacing];
            break;

            // other attrs not handled
        default:
            break;
    }
    constraint.active = YES;
    return constraint;
}

static NSLayoutConstraint * STACK(UIView * view1, CGFloat spacing, UIView * view2, UILayoutConstraintAxis axis) {
    NSLayoutConstraint * constraint;
    switch (axis) {
        case UILayoutConstraintAxisHorizontal:
            constraint = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeTrailing multiplier:1 constant:spacing];
            break;
            
        case UILayoutConstraintAxisVertical:
            constraint = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeBottom multiplier:1 constant:spacing];
            break;
            
        default:
            break;
    }
    
    constraint.active = YES;
    return constraint;
}

@end
