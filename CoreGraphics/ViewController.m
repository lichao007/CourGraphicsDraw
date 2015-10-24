//
//  ViewController.m
//  CoreGraphics
//
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //用一个uiimageView作为背景
    
    _canvasImageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_canvasImageview];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //选择一个开始触摸的点在View上
    
    _startPoint = [[touches anyObject] locationInView:_canvasImageview];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //得到当前触摸的点
    
    CGPoint curPos = [[touches anyObject] locationInView:_canvasImageview];
    
    @autoreleasepool {
        
        //开始绘图指定一个绘制缓冲区
        
        UIGraphicsBeginImageContext(_canvasImageview.bounds.size);
        
        //绘画上下文
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        //先把画布上的原始数据绘制上去
        
        [_canvasImageview drawRect:_canvasImageview.bounds];
        
        //设置画笔线的边帽
        
        CGContextSetLineCap(ctx, kCGLineCapRound);
        
        //设置画笔的粗细
        
        CGContextSetLineWidth(ctx, 5);
        
        //设置颜色
        
        CGContextSetRGBStrokeColor(ctx, 1,0 , 1, 1);
        
        //开始一个划线路径
        
        CGContextBeginPath(ctx);
        
        //移动画笔到开始点
        
        CGContextMoveToPoint(ctx, _startPoint.x, _startPoint.y);
        
        //把路径绘制到缓冲区
        
        CGContextAddLineToPoint(ctx, curPos.x, curPos.y);
        
        //把路径画到绘制缓冲区的画布里面
        
        CGContextStrokePath(ctx);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //事务结束,结束绘画
        
        _canvasImageview.image = image;
        
    }
    
    _startPoint = curPos;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
