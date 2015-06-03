//
//  ViewController.m
//  CoreLabel
//
//  Created by muxi on 15/3/26.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "CoreLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //代码创建
    [self code];
}



/**
 *  代码创建
 */
-(void)code{
    
    CoreLabel *label=[[CoreLabel alloc] initWithFrame:CGRectMake(0, 20, 320, 200)];
    
    label.layer.borderColor=[UIColor lightGrayColor].CGColor;
    label.layer.borderWidth=1.0f;
    
    label.text=@"我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本我是文本";
    
    [self.view addSubview:label];
    
    //修改对齐
    label.cl_verticalAlignment=CoreLabelVerticalAlignmentBottom;

    //设置行间距
    label.cl_lineSpacing=20;
    
    //设置首行缩进
    label.cl_firstLineHeadIndent = 30;
    
    //颜色
    [label addAttr:CoreLabelAttrColor value:[UIColor redColor] range:NSMakeRange(5, 5)];
    
    //字体加粗
    [label addAttr:CoreLabelAttrFont value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(16,6)];
    
    //倾斜
    [label addAttr:CoreLabelAttrObliqueness value:@(degree(-45)) range:NSMakeRange(15, 2)];
    
    //字间距
    [label addAttr:CoreLabelAttrKern value:@(10) range:NSMakeRange(40, 8)];
    
    //删除线
    [label addAttr:CoreLabelAttrDeleteLine value:[UIColor redColor] range:NSMakeRange(30, 3)];
    
    //下划线
    [label addAttr:CoreLabelAttrUnderLine value:[UIColor redColor] range:NSMakeRange(50, 3)];
    
    //添加一张图片
    [label addImage:[UIImage imageNamed:@"d_aini"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:1];
    
    //添加一张图片
    [label addImage:[UIImage imageNamed:@"d_chijing"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:5];
    
    //添加一张图片
    [label addImage:[UIImage imageNamed:@"d_chanzui"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:12];
    
    //更新
    [label updateLabelStyle];
}



@end
