//
//  TYHTitltView.h
//  TYHTitleButton
//
//  Created by Vieene on 16/7/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TYHTitleButtonType) {
    TYHTitleButtonImageRight = 0,
    TYHTitleButtonImageleft,
    TYHTitleButtonImageTop,
    TYHTitleButtonImagedown,
};
@interface TYHTitleButton : UIControl
//显示模式
@property (nonatomic,assign) TYHTitleButtonType  showMode;
//图片和文字的间距
@property (nonatomic,assign) CGFloat  distance;
//点击事件
@property (nonatomic,copy) void (^Clickblock)(UIControl *btn);
//创建对象
- (instancetype)initWithTitle:(NSString *)title NormalImage:(NSString *)NimageName highLight:(NSString *)HimageName;

@end
