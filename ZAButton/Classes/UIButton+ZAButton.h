//
//  UIButton+ZAButton.h
//  LGBButton
//
//  Created by mac_256 on 2018/5/2.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZAButtonImagePositionTop,
    ZAButtonImagePositionLeft,
    ZAButtonImagePositionBottom,
    ZAButtonImagePositionRight
} ZAButtonImagePosition;

@interface UIButton (ZAButton)

-(void)za_setImagePosition:(ZAButtonImagePosition)position andImageTitlePadding:(CGFloat)padding;

@end
