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
        
        CGFloat margin = (CGRectGetHeight(self.bounds) - CGRectGetHeight(self.imageView.bounds) - CGRectGetHeight(self.titleLabel.bounds) - padding) * 0.5;
        
        self.imageView.frame = CGRectMake(CGRectGetMidX(self.bounds) - CGRectGetMidX(self.imageView.bounds), margin, CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds));
        
        self.titleLabel.frame = CGRectMake(CGRectGetMidX(self.bounds) - CGRectGetMidX(self.titleLabel.bounds), CGRectGetMaxY(self.imageView.frame) + padding, CGRectGetWidth(self.titleLabel.bounds), CGRectGetHeight(self.titleLabel.bounds));
        
    }else if (position == ZAButtonImagePositionLeft){
        
        CGFloat margin = (CGRectGetWidth(self.bounds) - CGRectGetWidth(self.imageView.bounds) - CGRectGetWidth(self.titleLabel.bounds) - padding) * 0.5;
        self.imageView.frame = CGRectMake(margin, CGRectGetMidY(self.bounds) - CGRectGetMidY(self.imageView.bounds), CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds));
        
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + padding, CGRectGetMidY(self.bounds) - CGRectGetMidY(self.titleLabel.bounds), CGRectGetWidth(self.titleLabel.bounds), CGRectGetHeight(self.titleLabel.bounds));
        
    }else if (position == ZAButtonImagePositionBottom){
 
        CGFloat margin = (CGRectGetHeight(self.bounds) - CGRectGetHeight(self.imageView.bounds) - CGRectGetHeight(self.titleLabel.bounds) - padding) * 0.5;
        
        self.titleLabel.frame = CGRectMake(CGRectGetMidX(self.bounds) - CGRectGetMidX(self.titleLabel.bounds), margin, CGRectGetWidth(self.titleLabel.bounds), CGRectGetHeight(self.titleLabel.bounds));
        
        self.imageView.frame = CGRectMake(CGRectGetMidX(self.bounds) - CGRectGetMidX(self.imageView.bounds), CGRectGetMaxY(self.titleLabel.frame) + padding, CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds));
        
    }else if (position == ZAButtonImagePositionRight){
        
        CGFloat margin = (CGRectGetWidth(self.bounds) - CGRectGetWidth(self.imageView.bounds) - CGRectGetWidth(self.titleLabel.bounds) - padding) * 0.5;
        
        self.titleLabel.frame = CGRectMake(margin, CGRectGetMidY(self.bounds) - CGRectGetMidY(self.titleLabel.bounds), CGRectGetWidth(self.titleLabel.bounds), CGRectGetHeight(self.titleLabel.bounds));
        
        self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + padding, CGRectGetMidY(self.bounds) - CGRectGetMidY(self.imageView.bounds), CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds));
        
    }
}

@end
