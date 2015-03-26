//
//  CoreLabel.h
//  CoreLabel
//
//  Created by muxi on 15/3/26.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreLabel : UILabel

typedef enum VerticalAlignment {
    
    /**
     *  顶部对齐
     */
    CoreLabelVerticalAlignmentTop=0,
    
    /**
     *  垂直居中
     */
    CoreLabelVerticalAlignmentMiddle,
    
    /**
     *  底部对齐
     */
    CoreLabelVerticalAlignmentBottom,
    
    
} CoreLabelVerticalAlignment;





/**
 *  垂直对齐方式
 */
@property (nonatomic, assign) CoreLabelVerticalAlignment verticalAlignment;




/**
 *  样式
 */
@property (nonatomic,strong) NSMutableParagraphStyle *style;




/**
 *  直接设置样式，不会导致界面UI变化，需要手动调用更新
 */
-(void)updateLabelStyle;



/**
 *  设置颜色
 *
 *  @param color 颜色
 *  @param range 范围
 */
-(void)setColor:(UIColor *)color range:(NSRange)range;



/**
 *  设置字体
 *
 *  @param font  字体
 *  @param range 范围
 */
-(void)setFont:(UIFont *)font range:(NSRange)range;



@end
