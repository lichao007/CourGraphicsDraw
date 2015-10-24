//
//  ViewController.m
//  CoreGraphics3
//
//  Created by mac on 15/10/19.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ViewController.h"
#import "ZYCanvasView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[ZYCanvasView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
