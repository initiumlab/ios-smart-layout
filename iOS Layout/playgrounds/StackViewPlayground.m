//
//  StackViewPlayground.m
//  iOS Layout
//
//  Created by Cat Jia on 5/4/2016.
//  Copyright © 2016 Initium Media. All rights reserved.
//

#import "StackViewPlayground.h"

@interface StackViewPlayground ()

@property (nonatomic, strong) UIStackView * stackView;

@end

@implementation StackViewPlayground

@synthesize stackView = _stackView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        self.clipsToBounds = YES;
        
        // stack view
        _stackView = [[UIStackView alloc] init];
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.alignment = UIStackViewAlignmentFill;
        _stackView.distribution = UIStackViewDistributionFill;
        _stackView.spacing = 10;
        [self addSubview:_stackView];
        
        _stackView.translatesAutoresizingMaskIntoConstraints = NO;
        // [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[_stackView]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_stackView)]];
        // [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
        [NSLayoutConstraint activateConstraints:
         @[
           [_stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
           [_stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15],
           [_stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
           ]
         ];
        
        
        // content views
        UITextField * email = [[UITextField alloc] init];
        email.placeholder = @"name@example.com";
        email.autocorrectionType = UITextAutocorrectionTypeNo;
        [_stackView addArrangedSubview:email];
        
        UITextField * password = [[UITextField alloc] init];
        password.placeholder = @"• • • • • •";
        password.secureTextEntry = YES;
        [_stackView addArrangedSubview:password];
        
        {
             // need to use better implementation; e.g. subclass a UITextField
            CGFloat borderHeight = 4.0 / [UIScreen mainScreen].scale;
            
            UIView * emailBottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, email.frame.size.height - borderHeight, email.frame.size.width, borderHeight)];
            emailBottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            emailBottomLine.backgroundColor = [UIColor blackColor];
            [email addSubview:emailBottomLine];
            
            UIView * passwordBottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, password.frame.size.height - borderHeight, password.frame.size.width, borderHeight)];
            passwordBottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            passwordBottomLine.backgroundColor = [UIColor blackColor];
            [password addSubview:passwordBottomLine];
        }
        
        UIStackView * rightAlignView = [[UIStackView alloc] init];
        rightAlignView.alignment = UIStackViewAlignmentLeading;
        [_stackView addArrangedSubview:rightAlignView];
        
        {
            UIView * flexibleView = [[UIView alloc] init];
            [rightAlignView addArrangedSubview:flexibleView];
            
            UIButton * forgetPassword;
            forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
            [forgetPassword setTitle:@"忘記密碼？" forState:UIControlStateNormal];
            [forgetPassword setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            forgetPassword.titleLabel.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
            [forgetPassword addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
            [rightAlignView addArrangedSubview:forgetPassword];
            [forgetPassword setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            
            // extra padding
            [rightAlignView.heightAnchor constraintEqualToAnchor:forgetPassword.heightAnchor multiplier:1 constant:15].active = YES;
        }

        UIButton * loginButton = [[UIButton alloc] init];
        loginButton.backgroundColor = [UIColor whiteColor];
        [loginButton setTitle:@"登錄" forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [_stackView addArrangedSubview:loginButton];
        
        UIButton * registerButton = [[UIButton alloc] init];
        NSMutableAttributedString * registerString = [[NSMutableAttributedString alloc] initWithString:@"註冊新帳號" attributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleThick), NSUnderlineColorAttributeName: [UIColor purpleColor]}];
        [registerButton setAttributedTitle:registerString forState:UIControlStateNormal];
        [registerButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [_stackView addArrangedSubview:registerButton];
        

        // extra constraints
        for (UITextField * textField in @[email, password]) {
            // [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[textField(==textFieldHeight)]" options:0 metrics:@{@"textFieldHeight": @32} views:NSDictionaryOfVariableBindings(textField)]];
            [textField.heightAnchor constraintEqualToConstant:32].active = YES;
        }
        
    }
    return self;
}

- (void)didTapButton:(UIButton *)button
{
    [self endEditing:YES];
}

@end
