//
//  CoreLabel.h
//  CoreLabel
//
//  Created by muxi on 15/3/26.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define degree(d) (M_PI * d / 180.0f)




/** 对齐方式 */
typedef enum VerticalAlignment {
    
    /** 顶部对齐 */
    CoreLabelVerticalAlignmentTop = 0,
    
    /** 垂直居中 */
    CoreLabelVerticalAlignmentMiddle,
    
    /** 底部对齐 */
    CoreLabelVerticalAlignmentBottom,
    
} CoreLabelVerticalAlignment;


/** 属性 */
typedef enum{
    
    //颜色
    CoreLabelAttrColor = 0,
    
    //字体
    CoreLabelAttrFont,
    
    //斜体
    CoreLabelAttrObliqueness,
    
    //字间距
    CoreLabelAttrKern,
    
    //删除线
    CoreLabelAttrDeleteLine,
    
    //下划线
    CoreLabelAttrUnderLine,
    
} CoreLabelAttr;





@interface CoreLabel : UILabel



/** 垂直对齐方式 */
@property (nonatomic, assign) CoreLabelVerticalAlignment cl_verticalAlignment;

/** 首行缩进 */
@property (nonatomic,assign) CGFloat cl_firstLineHeadIndent;

/** 行间距 */
@property (nonatomic,assign) CGFloat cl_lineSpacing;

/** 对齐 */
@property (nonatomic,assign) NSTextAlignment cl_alignment;

/** 段落之前的间距 */
@property (nonatomic,assign) CGFloat cl_paragraphSpacing;


/**
 *  添加属性
 *
 *  @param attr  属性类型
 *  @param value 属性值值
 *  @param range range
 */
-(void)addAttr:(CoreLabelAttr)attr value:(id)value range:(NSRange)range;


-(void)addImage:(UIImage *)image size:(CGSize)size offset:(UIOffset)offset location:(NSUInteger)location;









/** 直接设置样式，不会导致界面UI变化，需要手动调用更新 */
-(void)updateLabelStyle;







@end
