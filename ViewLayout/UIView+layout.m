//
//  UIView+layout.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "UIView+layout.h"

@implementation UIView (layout)

#pragma mark - layout height
- (NSLayoutConstraint *)layout_height:(CGFloat)height
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:height];
    [superview addConstraint:constraint];
    return constraint;
}
- (NSLayoutConstraint *)layout_heightEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}
#pragma mark - layout width
- (NSLayoutConstraint *)layout_width:(CGFloat)width
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:width];
    [superview addConstraint:constraint];
    return constraint;
}
- (NSLayoutConstraint *)layout_widthEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}
#pragma mark - size
- (void)layout_size:(CGSize)size
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_height:size.height];
    [self layout_width:size.width];
}
- (void)layout_sizeEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_heightEqualToView:view];
    [self layout_widthEqualToView:view];
}

#pragma mark - layout center
- (void)layout_centerEqualToView:(UIView *)view{
    [self layout_centerXEqualToView:view];
    [self layout_centerYEqualToView:view];
}
- (NSLayoutConstraint *)layout_centerXEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)layout_centerYEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}

#pragma mark - layout align
- (NSLayoutConstraint *)layout_top:(CGFloat)top toView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0 constant:top];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)bottom toView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:bottom];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)left toView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:left];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)right toView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0 constant:right];
    [superview addConstraint:constraint];
    return constraint;
}


- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:edgeInsets.left toView:superview];
    [self layout_right:edgeInsets.right toView:superview];
    [self layout_top:edgeInsets.top toView:superview];
    [self layout_bottom:edgeInsets.bottom toView:superview];
}

- (void)layout_fillWidth
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:0 toView:superview];
    [self layout_right:0 toView:superview];
}

- (void)layout_fillHeight
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_top:0 toView:superview];
    [self layout_bottom:0 toView:superview];
}

- (void)layout_fill
{
    [self layout_fillWidth];
    [self layout_fillHeight];
}

@end
