//
//  CustomView.m
//  LGBButton
//
//  Created by mac_256 on 2018/5/2.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "CustomView.h"
#import "UIButton+ZAButton.h"
#import "LGBLog.h"

@interface CustomView ()
@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *bottomButton;

//@property (nonatomic, strong) LGBButton *topBt;
//@property (nonatomic, strong) LGBButton *leftBt;
//@property (nonatomic, strong) LGBButton *bottomBt;
//@property (nonatomic, strong) LGBButton *rightBt;
@end

@implementation CustomView

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
//    [self.topButton za_setTopImageBottomTitlePadding:5];
//
//    self.topButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    
//    [self.topButton sizeToFit];
    
}

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.bounds), CGRectGetHeight(scrollView.bounds) * 1.2);
    
    [self addSubview:scrollView];
    
    UIButton *topButton = [self createButtonWithTitle:@"TopImage"];
    self.topButton = topButton;
    self.topButton.frame = CGRectMake(15, 70, 180, 180);
    [scrollView addSubview:self.topButton];
//    [self.topButton za_setImagePosition:ZAButtonImagePositionTop imageTitlePadding:5];
    [self.topButton za_setImagePosition:ZAButtonImagePositionTop andImageTitlePadding:5];
    
    
    self.leftButton = [self createButtonWithTitle:@"LeftImage"];
    self.leftButton.frame = CGRectMake(100, CGRectGetMaxY(self.topButton.frame) + 20, 150, 60);
//    [self.leftButton setImage:[UIImage imageNamed:@"rising_arrow"] forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
    
    [scrollView addSubview:self.leftButton];
//    [self.leftButton za_setImagePosition:ZAButtonImagePositionLeft imageTitlePadding:0];
    [self.leftButton za_setImagePosition:ZAButtonImagePositionLeft andImageTitlePadding:5];
    
    
    self.rightButton = [self createButtonWithTitle:@"RightImage"];
    self.rightButton.frame = CGRectMake(100, CGRectGetMaxY(self.leftButton.frame) + 10, 180, 50);
//    [self.rightButton setImage:[UIImage imageNamed:@"train"] forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [scrollView addSubview:self.rightButton];
//    [self.rightButton za_setImagePosition:ZAButtonImagePositionRight imageTitlePadding:10];
    [self.rightButton za_setImagePosition:ZAButtonImagePositionRight andImageTitlePadding:5];
    
    self.bottomButton = [self createButtonWithTitle:@"BottomImage"];
    self.bottomButton.frame = CGRectMake(100, CGRectGetMaxY(self.rightButton.frame) + 10, 180, 100);
    [scrollView addSubview:self.bottomButton];
//    [self.bottomButton za_setImagePosition:ZAButtonImagePositionRight imageTitlePadding:10];
    [self.bottomButton za_setImagePosition:ZAButtonImagePositionBottom andImageTitlePadding:10];
    
    
//    self.topBt = [self createBtWithTitle:@"TopImg"];
//    self.topBt.frame = CGRectMake(100, CGRectGetMaxY(self.bottomButton.frame) + 10, 180, 100);
//    [scrollView addSubview:self.topBt];
//    [self.topBt setImagePosition:LGBButtonImagePositionTop imageTitlePadding:5];
//
//    self.leftBt = [self createBtWithTitle:@"LeftImg"];
//    self.leftBt.frame = CGRectMake(100, CGRectGetMaxY(self.topBt.frame) + 10, 180, 60);
//    [scrollView addSubview:self.leftBt];
//    [self.leftBt setImagePosition:LGBButtonImagePositionLeft imageTitlePadding:5];
//
//    self.bottomBt = [self createBtWithTitle:@"BottomImg"];
//    self.bottomBt.frame = CGRectMake(100, CGRectGetMaxY(self.leftBt.frame) + 10, 180, 100);
//    [scrollView addSubview:self.bottomBt];
//    [self.bottomBt setImagePosition:LGBButtonImagePositionTop imageTitlePadding:5];
//
//    self.rightBt = [self createBtWithTitle:@"RightImg"];
//    self.rightBt.frame = CGRectMake(100, CGRectGetMaxY(self.bottomBt.frame) + 10, 180, 60);
//    [scrollView addSubview:self.rightBt];
//    [self.rightBt setImagePosition:LGBButtonImagePositionLeft imageTitlePadding:5];
    
}
-(UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
//    UIImage *img = [[UIImage imageNamed:@"icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    [button setImage:[UIImage imageNamed:@"black_img"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    ZA_showDebugBorderForViewColor(button, [UIColor redColor]);
//    ZA_showDebugBorderForViewColor(button.titleLabel, [UIColor redColor]);
//    ZA_showDebugBorderForViewColor(button.imageView, [UIColor redColor]);
//    button.titleLabel.backgroundColor = [UIColor yellowColor];
    return button;
}

//-(LGBButton *)createBtWithTitle:(NSString *)title
//{
//    LGBButton *button = [LGBButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:title forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
//
//    //    UIImage *img = [[UIImage imageNamed:@"icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
//    [button setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    ZA_showDebugBorderForViewColor(button, [UIColor redColor]);
//    return button;
//}
#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
