//
//  UIView+Layout.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

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
    NSLayoutConstraint *constraint = [self layout_height:0 equalToView:view relation:NSLayoutRelationEqual];
    return constraint;
}
- (NSLayoutConstraint *)layout_height:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeHeight relation:relation toItem:view toAttribute:NSLayoutAttributeHeight multiplier:1.0];
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
    NSLayoutConstraint *constraint = [self layout_width:0 equalToView:view relation:NSLayoutRelationEqual];
    return constraint;
}
- (NSLayoutConstraint *)layout_width:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeWidth relation:relation toItem:view toAttribute:NSLayoutAttributeWidth multiplier:1.0];
    return constraint;
}
#pragma mark - size
- (void)layout_size:(CGSize)size
{
    [self layout_height:size.height];
    [self layout_width:size.width];
}
- (void)layout_sizeEqualToView:(UIView *)view
{
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
#pragma mark - top
- (NSLayoutConstraint *)layout_top:(CGFloat)constant{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    NSLayoutConstraint *constraint = [self layout_top:constant toItem:superview toAttribute:NSLayoutAttributeTop];
    return constraint;
}
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toItem:(id)item
{
    NSLayoutConstraint *constraint = [self layout_top:constant toItem:item toAttribute:NSLayoutAttributeTop];
    return constraint;
}
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_top:constant relation:NSLayoutRelationEqual toItem:item toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_top:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeTop relation:relation toItem:item toAttribute:toAttribute multiplier:1.0];
    return constraint;
}

#pragma mark - bottom
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    NSLayoutConstraint *constraint = [self layout_bottom:constant toItem:superview toAttribute:NSLayoutAttributeBottom];
    return constraint;
}
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toItem:(id)item
{
    NSLayoutConstraint *constraint = [self layout_bottom:constant toItem:item toAttribute:NSLayoutAttributeBottom];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_bottom:constant relation:NSLayoutRelationEqual toItem:item toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeBottom relation:relation toItem:item toAttribute:toAttribute multiplier:1.0];
    return constraint;
}
#pragma mark - left
- (NSLayoutConstraint *)layout_left:(CGFloat)constant{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    NSLayoutConstraint *constraint = [self layout_left:constant toItem:superview toAttribute:NSLayoutAttributeLeft];
    return constraint;
}
- (NSLayoutConstraint *)layout_left:(CGFloat)constant toItem:(id)item
{
    NSLayoutConstraint *constraint = [self layout_left:constant toItem:item toAttribute:NSLayoutAttributeLeft];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_left:constant relation:NSLayoutRelationEqual toItem:item toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeLeft relation:relation toItem:item toAttribute:toAttribute multiplier:1.0];
    return constraint;
}
#pragma mark - right
- (NSLayoutConstraint *)layout_right:(CGFloat)constant{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    NSLayoutConstraint *constraint = [self layout_right:constant toItem:superview toAttribute:NSLayoutAttributeRight];
    return constraint;
}
- (NSLayoutConstraint *)layout_right:(CGFloat)constant toItem:(id)item
{
    NSLayoutConstraint *constraint = [self layout_right:constant toItem:item toAttribute:NSLayoutAttributeRight];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_right:constant relation:NSLayoutRelationEqual toItem:item toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeRight relation:relation toItem:item toAttribute:toAttribute multiplier:1.0];
    return constraint;
}
#pragma mark - fill & insets
- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:edgeInsets.left toItem:superview];
    [self layout_right:edgeInsets.right toItem:superview];
    [self layout_top:edgeInsets.top toItem:superview];
    [self layout_bottom:edgeInsets.bottom toItem:superview];
}
- (void)layout_fill
{
    [self layout_fillWidth];
    [self layout_fillHeight];
}
- (void)layout_fillWidth
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:0 toItem:superview];
    [self layout_right:0 toItem:superview];
}

- (void)layout_fillHeight
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_top:0 toItem:superview];
    [self layout_bottom:0 toItem:superview];
}


#pragma mark - remove
- (void)removeAllConstraints{
    UIView *superview = self.superview;
    if (superview == nil) {
        return;
    }
    NSMutableArray *deactivate = @[].mutableCopy;
    for (NSLayoutConstraint *constraint in superview.constraints) {
        if (constraint.firstItem && constraint.firstItem == self) {
            [deactivate addObject:constraint];
        }
    }
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0) {
        [NSLayoutConstraint deactivateConstraints:deactivate];
    }else{
        [superview removeConstraints:deactivate];
    }
    
}

#pragma mark - Private Method
- (NSLayoutConstraint *)layout_constant:(CGFloat)constant
                              attribute:(NSLayoutAttribute)attribute
                               relation:(NSLayoutRelation)relation
                                 toItem:(id)item
                            toAttribute:(NSLayoutAttribute)toAttribute
                             multiplier:(CGFloat)multiplier
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:item attribute:toAttribute multiplier:multiplier constant:constant];
    [superview addConstraint:constraint];
    return constraint;
}

@end
