//
//  LLExampleBasicView.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "LLExampleBasicView.h"
#import "UIView+layout.h"

@implementation LLExampleBasicView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    
    UIView *superview = self;
    int padding = 10;
    
    
    [greenView layout_top:padding relation:NSLayoutRelationGreaterThanOrEqual toView:superview toAttribute:NSLayoutAttributeTop];
    [greenView layout_left:padding toView:superview];
    [greenView layout_bottom:-padding toView:blueView toAttribute:NSLayoutAttributeTop];
    [greenView layout_right:-padding toView:redView toAttribute:NSLayoutAttributeLeft];
    [greenView layout_widthEqualToView:redView];
    [greenView layout_heightEqualToView:redView];
    [greenView layout_heightEqualToView:blueView];
    
    [redView layout_top:padding toView:superview];
    [redView layout_left:padding toView:greenView toAttribute:NSLayoutAttributeRight];
    [redView layout_bottom:-padding toView:blueView toAttribute:NSLayoutAttributeTop];
    [redView layout_right:-padding toView:superview];
    [redView layout_widthEqualToView:greenView];
    
    [redView layout_heightEqualToView:greenView];
    [redView layout_heightEqualToView:blueView];
    
    [blueView layout_top:padding toView:greenView toAttribute:NSLayoutAttributeBottom];
    [blueView layout_left:padding toView:superview];
    [blueView layout_bottom:-padding toView:superview];
    [blueView layout_right:-padding toView:superview];
    
    [blueView layout_heightEqualToView:greenView];
    [blueView layout_heightEqualToView:redView];
    
    /*** demo 是从masonry 中拿过来的，对比写法
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.top).offset(padding);
        make.left.equalTo(superview.left).offset(padding);
        make.bottom.equalTo(blueView.top).offset(-padding);
        make.right.equalTo(redView.left).offset(-padding);
        make.width.equalTo(redView.width);
        
        make.height.equalTo(redView.height);
        make.height.equalTo(blueView.height);
        
    }];
    
    //with is semantic and option
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding); //with with
        make.left.equalTo(greenView.mas_right).offset(padding); //without with
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(greenView.mas_width);
        
        make.height.equalTo(@[greenView, blueView]); //can pass array of views
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(@[greenView.mas_height, redView.mas_height]); //can pass array of attributes
    }];
     
    */
    
    return self;
}

@end
