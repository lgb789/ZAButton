//
//  UIButton+ZAButton.m
//  LGBButton
//
//  Created by mac_256 on 2018/5/2.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import "UIButton+ZAButton.h"
#import <objc/runtime.h>

@implementation UIButton (ZAButton)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"layoutSubviews"));
        Method replacementMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"za_layoutSubviews"));
        method_exchangeImplementations(originalMethod, replacementMethod);
    });
}

-(void)za_layoutSubviews
{
    [self za_layoutSubviews];
    
    id position = [self za_position];
    if (position) {
        [self za_updateFrameWithPosition:[position integerValue] padding:[[self za_padding] floatValue]];
    }
}

-(void)za_setImagePosition:(ZAButtonImagePosition)position andImageTitlePadding:(CGFloat)padding
{
    objc_setAssociatedObject(self, @selector(za_position), @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @selector(za_padding), @(padding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)za_position
{
    return objc_getAssociatedObject(self, _cmd);
}

-(id)za_padding
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)za_updateFrameWithPosition:(ZAButtonImagePosition)position padding:(CGFloat)padding
{
    if (position == ZAButtonImagePositionTop) {
        
        self.titleEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, -CGRectGetWidth(self.imageView.bounds), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0);
        
    }else if (position == ZAButtonImagePositionLeft){
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -padding);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
        
    }else if (position == ZAButtonImagePositionBottom){

        self.titleEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds) + CGRectGetHeight(self.titleLabel.bounds) + padding, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -CGRectGetWidth(self.titleLabel.bounds));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(CGRectGetHeight(self.titleLabel.bounds) + padding / 2, 0, 0, 0);
    }else if (position == ZAButtonImagePositionRight){

        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(CGRectGetWidth(self.imageView.bounds) * 2), 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(CGRectGetWidth(self.titleLabel.bounds) * 2 + padding));
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding / 2);
        
    }
}

@end
