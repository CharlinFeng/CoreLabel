//
//  CoreLabelModel.m
//  CoreLabel
//
//  Created by 冯成林 on 15/6/3.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreLabelModel.h"

@implementation CoreLabelModel

/** 快速实例化 */
+(instancetype)labelModelWithAttachment:(NSTextAttachment *)attachment index:(NSUInteger)index{
    
    CoreLabelModel *labelModel = [[CoreLabelModel alloc] init];
    
    labelModel.attrString = [NSAttributedString attributedStringWithAttachment:attachment];
    
    labelModel.index = index;
    
    return labelModel;
}


/** 排序 */
+(NSArray *)sortLabelModels:(NSArray *)labelModels{
    
    NSArray *sortedLabelModels = [labelModels sortedArrayUsingComparator:^NSComparisonResult(CoreLabelModel *labelModel1, CoreLabelModel *labelModel2) {
        
        if(labelModel1.index < labelModel2.index) return NSOrderedAscending;
        
        if(labelModel1.index > labelModel2.index) return NSOrderedDescending;
        
        return NSOrderedSame;
    }];
    
    return sortedLabelModels;
}


@end
