//
//  CoreLabel.m
//  CoreLabel
//
//  Created by muxi on 15/3/26.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreLabel.h"

@interface CoreLabel ()


/**
 *  带有样式的string
 */
@property (nonatomic,strong) NSMutableAttributedString *attrStringM;

@end





@implementation CoreLabel



-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //控件初始化
        [self coreLabelPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //控件初始化
        [self coreLabelPrepare];
        
        //从xib创建不会调用setText方法
        [self setText:self.text];
    }
    
    return self;
}



/**
 *  控件初始化
 */
-(void)coreLabelPrepare{
    
    //设置对齐
    self.verticalAlignment=CoreLabelVerticalAlignmentMiddle;
}



-(void)setText:(NSString *)text{
    
    [super setText:text];
    
    //新建一个带有样式的字符串
    NSMutableAttributedString *attrStringM=[[NSMutableAttributedString alloc] initWithString:text];
    
    //记录
    self.attrStringM=attrStringM;
    //设置
    self.attributedText=attrStringM;
}



-(void)setVerticalAlignment:(CoreLabelVerticalAlignment)verticalAlignment{
    
    _verticalAlignment = verticalAlignment;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
}



- (void)drawTextInRect:(CGRect)rect
{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:actualRect];
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case CoreLabelVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case CoreLabelVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case CoreLabelVerticalAlignmentMiddle:
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    
    return textRect;
}


-(NSMutableParagraphStyle *)style{
    
    if(_style==nil){
        
        NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc] init];
        
        //记录
        _style=style;
        
        //样式初始化
        //设置行间距
        style.lineSpacing=0;
        
        //段落间距
        style.paragraphSpacing=0;
        
        //首行缩进
        style.firstLineHeadIndent=0;
        
        CGFloat height=self.font.pointSize;
        style.maximumLineHeight=height;
        style.lineHeightMultiple=0;
    }
    
    return _style;
}


/**
 *  直接设置样式，不会导致界面UI变化，需要手动调用更新
 */
-(void)updateLabelStyle{

    if(self.attrStringM==nil) return;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.attrStringM addAttribute:NSParagraphStyleAttributeName value:self.style range:NSMakeRange(0, self.attrStringM.length)];
        
        self.attributedText=self.attrStringM;
    });
}



/**
 *  设置颜色
 *
 *  @param color 颜色
 *  @param range 范围
 */
-(void)setColor:(UIColor *)color range:(NSRange)range{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.attrStringM addAttribute:NSForegroundColorAttributeName value:color range:range];
        self.attributedText=self.attrStringM;
    });
}



/**
 *  设置字体
 *
 *  @param font  字体
 *  @param range 范围
 */
-(void)setFont:(UIFont *)font range:(NSRange)range{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.attrStringM addAttribute:NSFontAttributeName value:font range:range];
        self.attributedText=self.attrStringM;
    });
}





@end
