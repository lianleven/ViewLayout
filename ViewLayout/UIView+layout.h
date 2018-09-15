//
//  UIView+layout.h
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (layout)

// height
- (NSLayoutConstraint *)layout_height:(CGFloat)height;
- (NSLayoutConstraint *)layout_heightEqualToView:(UIView *)view;

// width
- (NSLayoutConstraint *)layout_width:(CGFloat)width;
- (NSLayoutConstraint *)layout_widthEqualToView:(UIView *)view;

// size
- (void)layout_size:(CGSize)size;
- (void)layout_sizeEqualToView:(UIView *)view;

// center
- (void)layout_centerEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerXEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (NSLayoutConstraint *)layout_top:(CGFloat)top toView:(UIView *)view;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)bottom toView:(UIView *)view;
- (NSLayoutConstraint *)layout_left:(CGFloat)left toView:(UIView *)view;
- (NSLayoutConstraint *)layout_right:(CGFloat)right toView:(UIView *)view;

// UIEdgeInsets
- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)layout_fillWidth;
- (void)layout_fillHeight;
- (void)layout_fill;

@end
