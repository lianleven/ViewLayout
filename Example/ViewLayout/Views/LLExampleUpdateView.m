//
//  LLExampleUpdateView.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/16.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "LLExampleUpdateView.h"
#import "UIView+LLayout.h"
@interface LLExampleUpdateView ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, weak) NSLayoutConstraint *widthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *heightConstraint;

@end

@implementation LLExampleUpdateView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"Grow Me!" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    
    [self.growingButton addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.growingButton];
    
    self.buttonSize = CGSizeMake(100, 40);
    
    [self.growingButton layout_centerEqualToView:self];
    self.widthConstraint = [self.growingButton layout_width:self.buttonSize.width];
    self.widthConstraint.priority = 500;
    self.heightConstraint = [self.growingButton layout_height:self.buttonSize.height];
    self.heightConstraint.priority = 500;
    [self.growingButton layout_width:0 equalToView:self relation:NSLayoutRelationLessThanOrEqual];
    [self.growingButton layout_height:0 equalToView:self relation:NSLayoutRelationLessThanOrEqual];
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {
    self.widthConstraint.constant = self.buttonSize.width;
    self.heightConstraint.constant = self.buttonSize.height;
    /*
     [self.growingButton updateConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(self);
         make.width.equalTo(@(self.buttonSize.width)).priorityLow();
         make.height.equalTo(@(self.buttonSize.height)).priorityLow();
         make.width.lessThanOrEqualTo(self);
         make.height.lessThanOrEqualTo(self);
     }];
     */
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)didTapGrowButton:(UIButton *)button {
    self.buttonSize = CGSizeMake(self.buttonSize.width * 1.3, self.buttonSize.height * 1.3);
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
