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


@property (strong, nonatomic) IBOutlet CoreLabel *label2;

@property (strong, nonatomic) IBOutlet CoreLabel *label3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //代码创建
    [self code];

    //从xib创建
    [self xibCoreLabel];
    
    //颜色处理
    [self colorHandle];
}



/**
 *  代码创建
 */
-(void)code{
    
    CoreLabel *label=[[CoreLabel alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    
    label.layer.borderColor=[UIColor redColor].CGColor;
    label.layer.borderWidth=1.0f;
    
    label.text=@"我是文本我是文本我是文本我是文本我是文本";
    
    [self.view addSubview:label];
    
    //修改对齐
    label.verticalAlignment=CoreLabelVerticalAlignmentBottom;

    //设置行
    label.numberOfLines=0;
    
    //设置首行缩进
    label.style.firstLineHeadIndent=20;
    
    //行间距
    label.style.lineSpacing=10;

    //段间距
    label.style.paragraphSpacing=20;
    
    //更新
    [label updateLabelStyle];
    

}



/**
 *  从xib创建
 */
-(void)xibCoreLabel{
    
    //修改对齐
    _label2.verticalAlignment=CoreLabelVerticalAlignmentBottom;
    
    //间距
    _label2.style.lineSpacing=20;
    
    //更新
    [_label2 updateLabelStyle];
    
}

/**
 *  颜色处理
 */
-(void)colorHandle{
    
    [_label3 setColor:[UIColor redColor] range:NSMakeRange(3, 3)];
    
    [_label3 setFont:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, 3)];
    
 
}

@end
