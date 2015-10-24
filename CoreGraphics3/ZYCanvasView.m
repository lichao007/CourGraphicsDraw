//
//  ZYCanvasView.m
//  CoreGraphics3
//
//  Created by mac on 15/10/19.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYCanvasView.h"

@implementation ZYCanvasView

-(id)init
{
    self = [super init];
    
    if (self){
        
        _bezierPath = [UIBezierPath bezierPath];
        
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [_bezierPath moveToPoint:[touches.anyObject locationInView:self]];

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_bezierPath addLineToPoint:[touches.anyObject locationInView:self]];
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    [[UIColor redColor] setStroke];
    
    [_bezierPath stroke];

}

@end
