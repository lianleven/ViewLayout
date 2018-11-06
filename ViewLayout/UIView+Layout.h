//
//  UIView+Layout.h
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (Layout)

// height
- (NSLayoutConstraint *)layout_height:(CGFloat)height;
- (NSLayoutConstraint *)layout_heightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_height:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation;

// width
- (NSLayoutConstraint *)layout_width:(CGFloat)width;
- (NSLayoutConstraint *)layout_widthEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_width:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation;

// size
- (void)layout_size:(CGSize)size;
- (void)layout_sizeEqualToView:(UIView *)view;

// center
- (void)layout_centerEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerXEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerYEqualToView:(UIView *)view;

//
#pragma mark - top, bottom, left, right
- (NSLayoutConstraint *)layout_top:(CGFloat)constant;
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toItem:(id)item;
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_top:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toItem:(id)item;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_left:(CGFloat)constant;
- (NSLayoutConstraint *)layout_left:(CGFloat)constant toItem:(id)item;
- (NSLayoutConstraint *)layout_left:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_left:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_right:(CGFloat)constant;
- (NSLayoutConstraint *)layout_right:(CGFloat)constant toItem:(id)item;
- (NSLayoutConstraint *)layout_right:(CGFloat)constant toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_right:(CGFloat)constant relation:(NSLayoutRelation)relation toItem:(id)item toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_constant:(CGFloat)constant
                              attribute:(NSLayoutAttribute)attribute
                               relation:(NSLayoutRelation)relation
                                 toItem:(id)item
                            toAttribute:(NSLayoutAttribute)toAttribute
                             multiplier:(CGFloat)multiplier;

// UIEdgeInsets
- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)layout_fillWidth;
- (void)layout_fillHeight;
- (void)layout_fill;

#pragma mark - remove
- (void)removeAllConstraints;

@end
NS_ASSUME_NONNULL_END
