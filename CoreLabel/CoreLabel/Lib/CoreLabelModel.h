//
//  CoreLabelModel.h
//  CoreLabel
//
//  Created by 冯成林 on 15/6/3.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CoreLabelModel : NSObject

/** 带有样式的字符串 */
@property (nonatomic,strong) NSAttributedString *attrString;

/** 位置 */
@property (nonatomic,assign) NSUInteger index;



/** 快速实例化 */
+(instancetype)labelModelWithAttachment:(NSTextAttachment *)attachment index:(NSUInteger)index;


/** 排序 */
+(NSArray *)sortLabelModels:(NSArray *)labelModels;



@end
