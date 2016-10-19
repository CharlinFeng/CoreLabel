//
//  CoreLabel.m
//  CoreLabel
//
//  Created by muxi on 15/3/26.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreLabel.h"
#import "CoreLabelModel.h"

@interface CoreLabel ()



/** 带有样式的string */
@property (nonatomic,strong) NSMutableAttributedString *attrStringM;

/** 样式 */
@property (nonatomic,strong) NSMutableParagraphStyle *style;

/** 附件 */
@property (nonatomic,strong) NSMutableArray *attatchmentsM;


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
    self.cl_verticalAlignment=CoreLabelVerticalAlignmentMiddle;
    
    //默认多行显示
    self.numberOfLines=0;
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


-(void)setCl_verticalAlignment:(CoreLabelVerticalAlignment)cl_verticalAlignment{
    
    _cl_verticalAlignment = cl_verticalAlignment;
    
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
    switch (self.cl_verticalAlignment) {
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
    
//    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self.attrStringM addAttribute:NSParagraphStyleAttributeName value:self.style range:NSMakeRange(0, self.attrStringM.length)];
        
        //添加图片附件
        if(self.attatchmentsM.count != 0){
            
            //排序
            NSArray *sortedLabelModels = [CoreLabelModel sortLabelModels:self.attatchmentsM];
            
            [sortedLabelModels enumerateObjectsUsingBlock:^(CoreLabelModel *labelModel, NSUInteger idx, BOOL *stop) {
                
                NSAttributedString *attrString = labelModel.attrString;
                NSUInteger index = labelModel.index + idx;
                
                [self.attrStringM insertAttributedString:attrString atIndex:index];
            }];
        }
        
        self.attributedText=self.attrStringM;
//    });
}


/** 基本属性 */
/** 首行缩进 */
-(void)setCl_firstLineHeadIndent:(CGFloat)cl_firstLineHeadIndent{
    
    _cl_firstLineHeadIndent = cl_firstLineHeadIndent;
    
    self.style.firstLineHeadIndent = cl_firstLineHeadIndent;
}

/** 行间距 */
-(void)setCl_lineSpacing:(CGFloat)cl_lineSpacing{
    
    _cl_lineSpacing = cl_lineSpacing;
    
    self.style.lineSpacing = cl_lineSpacing;
}




/** 段落之前的间距 */
-(void)setCl_paragraphSpacing:(CGFloat)cl_paragraphSpacing{
    
    _cl_paragraphSpacing = cl_paragraphSpacing;
    
    self.style.paragraphSpacing = cl_paragraphSpacing;
}

-(void)setCl_alignment:(NSTextAlignment)cl_alignment {
    
    _cl_alignment = cl_alignment;
    
    self.style.alignment = cl_alignment;
}



/**
 *  添加属性
 *
 *  @param attr  属性类型
 *  @param value 属性值值
 *  @param range range
 */
-(void)addAttr:(CoreLabelAttr)attr value:(id)value range:(NSRange)range{
    
    switch (attr) {
            
        case CoreLabelAttrColor: //添加颜色
            [self setColor:value range:range];
            break;
            
        case CoreLabelAttrFont: //字体
            [self setFont:value range:range];
            break;
            
        case CoreLabelAttrObliqueness: //粗体
            [self setObliqueness:value range:range];
            break;
            
        case CoreLabelAttrKern: //字间距
            [self setKern:value range:range];
            break;
        case CoreLabelAttrDeleteLine: //删除线
            [self setDeleteLineWithColor:value range:range];
            break;
            
        case CoreLabelAttrUnderLine: //下划线
            [self setUnderLineWithColor:value range:range];
            break;
            
        default:
            break;
    }
}


-(void)addImage:(UIImage *)image size:(CGSize)size offset:(UIOffset)offset location:(NSUInteger)location{
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    
    //设置图片
    attachment.image = image;
    
    if(CGSizeEqualToSize(size, CGSizeZero)) size = CGSizeMake(self.font.lineHeight, self.font.lineHeight);
    
    //设置大小
    attachment.bounds =(CGRect){CGPointMake(offset.horizontal, offset.vertical),size};
    
    CoreLabelModel *labelModel = [CoreLabelModel labelModelWithAttachment:attachment index:location];
    
    [self.attatchmentsM addObject:labelModel];
}


/** 下划线 */
-(void)setUnderLineWithColor:(UIColor *)color range:(NSRange)range{
    [self addAttrWithName:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
    [self addAttrWithName:NSUnderlineColorAttributeName value:color range:range];
}


/** 删除线 */
-(void)setDeleteLineWithColor:(UIColor *)color range:(NSRange)range{
    [self addAttrWithName:NSStrikethroughStyleAttributeName value:@(YES) range:range];
    [self addAttrWithName:NSStrikethroughColorAttributeName value:color range:range];
}


/** 字间距 */
-(void)setKern:(id)kern range:(NSRange)range{
    [self addAttrWithName:NSKernAttributeName value:kern range:range];
}



/** 斜体 */
-(void)setObliqueness:(id)obliqueness range:(NSRange)range{
    
    [self addAttrWithName:NSObliquenessAttributeName value:obliqueness range:range];
}




/** 颜色 */
-(void)setColor:(UIColor *)color range:(NSRange)range{
    
    [self addAttrWithName:NSForegroundColorAttributeName value:color range:range];
}



/** 字体 */
-(void)setFont:(UIFont *)font range:(NSRange)range{
    
    [self addAttrWithName:NSFontAttributeName value:font range:range];
}


-(void)addAttrWithName:(NSString *)name value:(id)value range:(NSRange)range{
    
//    dispatch_async(dispatch_get_main_queue(), ^{
        [self.attrStringM addAttribute:name value:value range:range];
        self.attributedText=self.attrStringM;
//    });
}



/** 懒加载 */
-(NSMutableArray *)attatchmentsM{
    
    if(_attatchmentsM == nil){
        
        _attatchmentsM = [NSMutableArray array];
    }
    
    return _attatchmentsM;
}


@end
