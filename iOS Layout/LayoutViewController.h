//
//  LayoutViewController.h
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *playground;

- (Class)playgroundContentViewClass;

@end
