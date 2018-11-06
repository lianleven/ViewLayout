//
//  LLExampleRemakeView.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/16.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "LLExampleRemakeView.h"
#import "UIView+Layout.h"

@interface LLExampleRemakeView()

@property (nonatomic, strong) UIButton *movingButton;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) BOOL topLeft;

- (void)toggleButtonPosition;

@end

@implementation LLExampleRemakeView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingButton setTitle:@"Move Me!" forState:UIControlStateNormal];
    self.movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    
    [self.movingButton addTarget:self action:@selector(toggleButtonPosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingButton];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"固定view" forState:UIControlStateNormal];
    self.button.layer.borderColor = UIColor.redColor.CGColor;
    self.button.layer.borderWidth = 3;
    [self addSubview:self.button];
    
    [self.button layout_size:CGSizeMake(100, 100)];
    [self.button layout_centerEqualToView:self];
    
    self.topLeft = YES;
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {
    [self.movingButton removeAllConstraints];
    [self.movingButton layout_size:CGSizeMake(100, 100)];
    if (self.topLeft) {
        [self.movingButton layout_left:10 toItem:self];
        [self.movingButton layout_top:10 toItem:self];
    }else{
        [self.movingButton layout_right:-10 toItem:self];
        [self.movingButton layout_bottom:-10 toItem:self];
    }
    
    /*
    [self.movingButton remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        
        if (self.topLeft) {
            make.left.equalTo(self.left).with.offset(10);
            make.top.equalTo(self.top).with.offset(10);
        }
        else {
            make.bottom.equalTo(self.bottom).with.offset(-10);
            make.right.equalTo(self.right).with.offset(-10);
        }
    }];
     */
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)toggleButtonPosition {
    self.topLeft = !self.topLeft;
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
