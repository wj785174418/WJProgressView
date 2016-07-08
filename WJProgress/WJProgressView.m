//
//  WJProgress.m
//  WJProgress
//
//  Created by HuayuNanyan on 16/7/7.
//  Copyright © 2016年 HuayuNanyan. All rights reserved.
//

#import "WJProgressView.h"

@interface WJProgressView ()
//圆环背景图层
@property (strong, nonatomic) CALayer *ringBackLayer;
//圆环图层
@property (strong, nonatomic) CALayer *ringLayer;
//中心图层
@property (strong, nonatomic) CALayer *centerLayer;

@end

@implementation WJProgressView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubLayer];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self addSubLayer];
    }
    return self;
}

-(void)addSubLayer{
    self.ringColor = [UIColor colorWithRed:30.0/255.0 green:144.0/255.0 blue:1.0 alpha:1];//dodger blue
    self.ringBackColor = [UIColor lightGrayColor];
    self.centerColor = [UIColor whiteColor];
    self.ringWidth = 8;
    self.progress = 0.5;
    
    self.ringBackLayer = [[CALayer alloc]init];
    self.ringLayer = [[CALayer alloc]init];
    self.centerLayer = [[CALayer alloc]init];
    [self.layer addSublayer:self.ringBackLayer];
    [self.layer addSublayer:self.ringLayer];
    [self.layer addSublayer:self.centerLayer];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.size.width = frame.size.height;
    self.frame = frame;
    
    self.layer.cornerRadius = self.frame.size.height/2;
    self.clipsToBounds = YES;
    
    [self layoutSublayers];
    self.ringBackLayer.delegate = self;
    self.ringLayer.delegate = self;
    self.centerLayer.delegate = self;
}

-(void)layoutSublayers{
    self.ringBackLayer.frame = self.bounds;
    self.ringLayer.frame = self.bounds;
    self.centerLayer.frame = self.bounds;
    
    [self.ringBackLayer setNeedsDisplay];
    [self.ringLayer setNeedsDisplay];
    [self.centerLayer setNeedsDisplay];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
    if (layer == self.ringBackLayer) {
        [self drawRingBackInContext:ctx];
        return;
    }
    
    if (layer == self.ringLayer) {
        [self drawRingInContext:ctx];
        return;
    }
    
    if (layer == self.centerLayer) {
        [self drawCenterInContext:ctx];
    }
}

-(void)drawRingBackInContext:(CGContextRef)ctx{
    CGFloat radius = self.frame.size.height/2;
    CGPoint center = CGPointMake(radius, radius);
    
    //draw
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddArc(ctx, center.x, center.y, radius, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(ctx, self.ringBackColor.CGColor);
    CGContextFillPath(ctx);
}

-(void)drawRingInContext:(CGContextRef)ctx{
    CGFloat radius = self.frame.size.height/2;
    CGPoint center = CGPointMake(radius, radius);
    
    //draw
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, center.x, center.y);
    
    CGFloat startAngle = self.startPosition * M_PI_2;
    CGFloat endAngle;
    if (self.direction) {
        endAngle = startAngle - 2*M_PI*self.progress;
    }else{
        endAngle = startAngle + 2*M_PI*self.progress;
    }
    
    CGContextAddArc(ctx, center.x, center.y, radius, startAngle, endAngle, self.direction);
    CGContextSetFillColorWithColor(ctx, self.ringColor.CGColor);
    CGContextFillPath(ctx);
}

-(void)drawCenterInContext:(CGContextRef)ctx{
    CGSize viewSize = self.frame.size;
    CGFloat radius = viewSize.height/2 - self.ringWidth;
    if (radius < 0) {
        radius = 0;
    }
    CGPoint center = CGPointMake(viewSize.width/2, viewSize.height/2);
    
    //draw
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddArc(ctx, center.x, center.y, radius, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(ctx, self.centerColor.CGColor);
    CGContextFillPath(ctx);
}

-(void)setProgress:(float)progress{
    float n = progress;
    if (n < 0.0) {
        n = 0.0;
    }
    
    if (n > 1.0) {
        n = 1.0;
    }
    _progress = n;
    [self.ringLayer setNeedsDisplay];
}

-(void)setRingWidth:(float)ringWidth{
    if (ringWidth <= 0) {
        _ringWidth = 8;
    }
    _ringWidth = ringWidth;
    [self.centerLayer setNeedsDisplay];
}

-(void)setRingBackColor:(UIColor *)ringBackColor{
    if (_ringBackColor == ringBackColor) {
        return;
    }
    _ringBackColor = ringBackColor;
    [self.ringBackLayer setNeedsDisplay];
}

-(void)setRingColor:(UIColor *)ringColor{
    if (_ringColor == ringColor) {
        return;
    }
    _ringColor = ringColor;
    [self.ringLayer setNeedsDisplay];
}

-(void)setCenterColor:(UIColor *)centerColor{
    if (_centerColor == centerColor) {
        return;
    }
    _centerColor = centerColor;
    [self.centerLayer setNeedsDisplay];
}

@end
















