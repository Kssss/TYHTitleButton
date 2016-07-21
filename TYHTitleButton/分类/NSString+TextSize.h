//
//  NSString+TextSize.h
//  NSString分类
//
//  Created by 二爷 on 13-09-26.
//  Copyright (c) 2013年 ErYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (TextSize)

- (CGSize)sizeWithFont:(UIFont *)font MaxSize:(CGSize)maxSize;

@end