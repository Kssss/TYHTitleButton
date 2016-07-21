//
//  TYHTitltView.m
//  TYHTitleButton
//
//  Created by Vieene on 16/7/20.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHTitleButton.h"
#import "NSString+TextSize.h"
#import "Masonry.h"
static int font;
@interface TYHTitleButton()
@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,copy) NSString *highLightImage;
@property (nonatomic,copy) NSString *normalImage;

@end
@implementation TYHTitleButton

- (instancetype)initWithTitle:(NSString *)title NormalImage:(NSString *)NimageName highLight:(NSString *)HimageName;{
    if (self = [super init]) {
        _normalImage = NimageName;
        _highLightImage = HimageName;
        _imageV = [[UIImageView alloc] init];
        _imageV.image = [UIImage imageNamed:NimageName];
        _title = [[UILabel alloc] init];
        font = 14;
        _title.font = [UIFont systemFontOfSize:font];
        _title.text = title;
        _title.textColor = [UIColor whiteColor];
        _imageV.backgroundColor = [UIColor purpleColor];
        _title.backgroundColor = [UIColor grayColor];
        [self addSubview:_imageV];
        [self addSubview:_title];
        self.backgroundColor = [UIColor clearColor];
        [self addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setDistance:(CGFloat)distance
{
    _distance = distance;
    [self setNeedsLayout];
    
}
- (void)setShowMode:(TYHTitleButtonType)showMode
{
    _showMode = showMode;
    [self setNeedsLayout];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat halfDisdance = _distance/2.0;
    CGFloat imageW = _imageV.image.size.width/2.0;
    CGFloat imageH = _imageV.image.size.height /2.0;
    //计算偏移
    CGFloat titleW =  [_title.text sizeWithFont:[UIFont systemFontOfSize:font] MaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    CGFloat offset = fabsf(imageW -titleW)/2.0;
    NSLog(@"imageW%f-----imageH%f-----offset%f",imageW,imageH,offset);
    
    switch (_showMode) {
        case TYHTitleButtonImageRight:
        {
            if (titleW > imageW) {
                offset = -offset;
            }
            [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_centerX).equalTo(@(halfDisdance - offset));
                make.centerY.equalTo(self.mas_centerY);
                make.width.equalTo(@(imageW));
                make.height.equalTo(@(imageH));
            }];
            [_title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.mas_centerX).equalTo(@(-halfDisdance - offset));
                make.centerY.equalTo(self.mas_centerY);
                _title.textAlignment = NSTextAlignmentRight;
            }];
        };
            break;
        case TYHTitleButtonImageleft:{
            if (imageW> titleW) {
                offset = -offset;
            }
            [_title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_centerX).equalTo(@(halfDisdance - offset));
                make.centerY.equalTo(self.mas_centerY);
                _title.textAlignment = NSTextAlignmentLeft;
            }];
            [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.mas_centerX).equalTo(@(-halfDisdance - offset));
                make.centerY.equalTo(self.mas_centerY);
                make.width.equalTo(@(imageW));
                make.height.equalTo(@(imageH));
            }];
        }break;
        case TYHTitleButtonImageTop:{
            [_imageV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(-halfDisdance);
                make.centerX.equalTo(self);
                make.width.equalTo(@(imageW));
                make.height.equalTo(@(imageH));
            }];
            [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(halfDisdance);
                make.centerX.equalTo(self);
                _title.textAlignment = NSTextAlignmentCenter;
            }];
        }break;
        case TYHTitleButtonImagedown:{
            [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(-halfDisdance);
                make.centerX.equalTo(self);
                _title.textAlignment = NSTextAlignmentCenter;
            }];
            [_imageV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(halfDisdance);
                make.centerX.equalTo(self);
                make.width.equalTo(@(imageW));
                make.height.equalTo(@(imageH));
            }];
        }break;
        default:
            break;
    }
}
#pragma mark -active
- (void)clickBtn:(UIControl *)btn
{
    
    self.selected = !self.selected;
    if (self.selected) {
        self.imageV.image = [UIImage imageNamed:self.highLightImage];
    }else{
        self.imageV.image = [UIImage imageNamed:self.normalImage];
    }
    if (_Clickblock) {
        _Clickblock(btn);
    }
}
@end
