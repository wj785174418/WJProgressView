//
//  WJProgress.h
//  WJProgress
//
//  Created by HuayuNanyan on 16/7/7.
//  Copyright © 2016年 HuayuNanyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WJProgressStartPosition) {
    WJProgressStartPositionRight = 0,
    WJProgressStartPositionBottom = 1,
    WJProgressStartPositionLeft = 2,
    WJProgressStartPositionTop = 3
};//进度开始的位置

typedef NS_ENUM(NSInteger, WJProgressDirection) {
    WJProgressDirectionClockwise = 0,
    WJProgressDirectionCounterClockwise = 1
};//进度方向,顺逆时针

@interface WJProgressView : UIView
//中心背景颜色 (默认whiteColor)
@property (strong, nonatomic) UIColor *centerColor;
//圆环背景色 (默认lightGrayColor)
@property (strong, nonatomic) UIColor *ringBackColor;
//圆环进度颜色 (默认blueColor)
@property (strong, nonatomic) UIColor *ringColor;
//进度百分比字体颜色 (默认与ringColor相同)
@property (strong, nonatomic) UIColor *percentColor;
//圆环宽度 (默认为8)
@property (assign, nonatomic) float ringWidth;
//进度数值(0-1,默认0.0)
@property (assign, nonatomic) float progress;
//进度开始位置 (默认为右)
@property (assign, nonatomic) WJProgressStartPosition startPosition;
//进度方向 (默认顺时针)
@property (assign, nonatomic) WJProgressDirection direction;

@end











