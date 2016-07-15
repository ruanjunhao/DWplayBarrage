//
//  DWLiveVideoViewController.m
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/7.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import "DWLiveVideoViewController.h"
#import "BarrageRenderer.h"
#import "Masonry.h"
#import "DWScrollView.h"
#import "DWCartoonView.h"

//获取屏幕 宽度、高度
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface DWLiveVideoViewController (){
    NSInteger _index;
    int intClick;
    DWCartoonView*_cartoonView;
    BarrageRenderer * _renderer;
    DWScrollView*_ScrollView;
}
@property (strong, nonatomic)  DWCartoonView*cartoonView;
@end

@implementation DWLiveVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initcartoon];
    [self initDanmu];
    [self initScrollView];
    
}
-(void)initcartoon{
    _cartoonView=[[DWCartoonView alloc]init];
    [_cartoonView cortoonInitialize:self.view];
    [_cartoonView startCountingDown:10];//设置倒计时时间
}
-(void)initScrollView{
    intClick=1;
    __weak typeof(self) weakSelf = self;
    _ScrollView=[[DWScrollView alloc]initWithFrame:CGRectMake(0, 0,WIDTH,HEIGHT)];
    [self.view addSubview:_ScrollView];
    _ScrollView.birthdayView = ^{
    intClick++;
    [weakSelf.cartoonView animation:@"鲜花" loginString:[NSString stringWithFormat:@"+%d",intClick] initialPosition:CGRectMake(95, HEIGHT-65, 35,35)];
    };
}
-(void)initDanmu{
    _index = 0;
    _renderer = [[BarrageRenderer alloc]init];
    [_renderer setSpeed:1.0f];
    [self.view addSubview:_renderer.view];
    [_renderer start];
    [self performSelector:@selector(viewChanged) withObject:nil afterDelay:10.0f];
}
-(void)viewChanged
{
    [_renderer setSpeed:2.0f];
}

@end
