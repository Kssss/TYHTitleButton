//
//  ViewController.m
//  TYHTitleButton
//
//  Created by Vieene on 16/7/21.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "ViewController.h"
#import "TYHTitleButton.h"
#import "Masonry.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface ViewController ()
@property (nonatomic,strong)TYHTitleButton *titleView1;
@property (nonatomic,strong)TYHTitleButton *titleView2;
@property (nonatomic,strong)TYHTitleButton *titleView3;
@property (nonatomic,strong)TYHTitleButton *titleView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TYHTitleButton";
    [self.view addSubview:self.titleView1];
    [self.view addSubview:self.titleView2];
    [self.view addSubview:self.titleView3];
    [self.view addSubview:self.titleView4];
    
    
    self.titleView1.Clickblock = ^(UIControl *contro){
        NSLog(@"Clickblock titleView1  %@",contro);
    };
    self.titleView2.Clickblock = ^(UIControl *contro){
        NSLog(@"Clickblock titleView2  %@",contro);
    };
    self.titleView3.Clickblock = ^(UIControl *contro){
        NSLog(@"Clickblock titleView3  %@",contro);
    };
    self.titleView4.Clickblock = ^(UIControl *contro){
        NSLog(@"Clickblock titleView4 %@",contro);
    };
    WS(weakSelf)
    [self.titleView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
        make.centerX.equalTo(weakSelf.view);
        
    }];
    [self.titleView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(180);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
        make.centerX.equalTo(weakSelf.view);
        
    }];
    [self.titleView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(260);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
        make.centerX.equalTo(weakSelf.view);
        
    }];
    [self.titleView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(320);
        make.centerX.equalTo(weakSelf.view);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
    }];
}
- (TYHTitleButton *)titleView1
{
    if (_titleView1 == nil) {
        _titleView1 = [[TYHTitleButton alloc ] initWithTitle:@"TYHTitleButton" NormalImage:@"up" highLight:@"down"];
        _titleView1.distance = 5;
        _titleView1.showMode = TYHTitleButtonImageRight;
    }
    return _titleView1;
}
- (TYHTitleButton *)titleView2
{
    if (_titleView2 == nil) {
        _titleView2 = [[TYHTitleButton alloc ] initWithTitle:@"TYHTitleButton" NormalImage:@"up" highLight:@"down"];
        _titleView2.distance = 5;
        _titleView2.showMode = TYHTitleButtonImageleft;
    }
    return _titleView2;
}
- (TYHTitleButton *)titleView3
{
    if (_titleView3 == nil) {
        _titleView3 = [[TYHTitleButton alloc ] initWithTitle:@"TYHTitleButton" NormalImage:@"up" highLight:@"down"];
        _titleView3.distance = 5;
        _titleView3.showMode = TYHTitleButtonImageTop;
    }
    return _titleView3;
}
- (TYHTitleButton *)titleView4
{
    if (_titleView4 == nil) {
        _titleView4 = [[TYHTitleButton alloc ] initWithTitle:@"TYHTitleButton" NormalImage:@"up" highLight:@"down"];
        _titleView4.distance = 5;
        _titleView4.showMode = TYHTitleButtonImagedown;
    }
    return _titleView4;
}

@end
