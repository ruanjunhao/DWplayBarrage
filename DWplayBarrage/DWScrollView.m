//
//  DWScrollView.m
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/14.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import "DWScrollView.h"
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface DWScrollView ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic)  UICollectionView *bscrollView;

@property (nonatomic, strong) UILabel          *populationLel;
@property (nonatomic, strong) UIButton         *birthdayBto;
@property (nonatomic, strong) UITextField      *importTfd;


@property (nonatomic, strong) UIButton         *settingsBto;
@property (nonatomic, strong) UIButton         *stopBto;

@property (nonatomic, strong) UIButton         *emitBto;

@property (nonatomic, strong) UIButton         *belowBto;

@end




@implementation DWScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _populationLel = [self lableWithSuoerView:self text:@"1" textColor:[UIColor whiteColor] textFountSize:18];
        [_populationLel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.centerX.equalTo(self).offset(-(WIDTH/2-35));
            make.centerY.equalTo(self).offset(HEIGHT/2-35);
        }];
       _birthdayBto = [self buttonWithSuperView:_birthdayBto action:@selector(birthdayClick) title:@"🌹" imageName:@"" titleColor:nil];
        [_birthdayBto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.left.equalTo(_populationLel.mas_right).offset(20);
            make.centerY.equalTo(_populationLel);;
        }];
        _settingsBto = [self buttonWithSuperView:_settingsBto action:@selector(settingClick) title:@"上" imageName:@"" titleColor:nil];
        [_settingsBto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.centerX.equalTo(self).offset(WIDTH/2-35);
            make.centerY.equalTo(self).offset(HEIGHT/2-35);
        }];
        _stopBto=[self buttonWithSuperView:_stopBto action:@selector(stopClick) title:@"禁" imageName:@"" titleColor:nil];
        [_stopBto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.right.equalTo(_settingsBto.mas_left).offset(-20);
            make.centerY.equalTo(_settingsBto);;
        }];
        _emitBto=[self buttonWithSuperView:_emitBto action:@selector(emitClick) title:@"射" imageName:@"" titleColor:nil];
        [_emitBto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.right.equalTo(_stopBto.mas_left).offset(-20);
            make.centerY.equalTo(_settingsBto);;
        }];
        
        _importTfd = [[UITextField alloc]init];
        [self addSubview:_importTfd];
        [_importTfd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_birthdayBto.mas_right).offset(40);
            make.right.equalTo(_emitBto.mas_left).offset(-40);
            make.centerY.equalTo(_populationLel);;
            make.height.mas_equalTo(35);
        }];
        _importTfd.backgroundColor=[UIColor blackColor];
        _importTfd.layer.cornerRadius = 18;
        _importTfd.layer.masksToBounds = YES;
        _importTfd.alpha = 0.8;
        
       
       
        
    }
    return self;
}
-(void)birthdayClick{
    _birthdayView();
}
- (void)loadCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //水平间隔
    layout.minimumInteritemSpacing =0;
    //垂直行间距
    layout.minimumLineSpacing = 0;
    _bscrollView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,0,WIDTH ,183) collectionViewLayout:layout];
    _bscrollView.showsHorizontalScrollIndicator = NO;
    _bscrollView.backgroundColor =[UIColor clearColor];
    _bscrollView.dataSource = self;
    _bscrollView.delegate = self;
    self.frame=CGRectMake(0,HEIGHT-228,WIDTH ,228);
//    [_bscrollView registerClass:[WPropsCollectionViewCell class] forCellWithReuseIdentifier:@"WPropsCollectionViewCell"];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
        return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UserLogoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserLogoCell" forIndexPath:indexPath];
   
    return cell;
}

//头像点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
   
}




-(UILabel *)lableWithSuoerView:(UIView *)superView text:(NSString *)text textColor:(UIColor *)textColor textFountSize:(NSInteger )fountSize{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor=[UIColor blackColor];
    label.layer.cornerRadius = 18;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 1;
    label.alpha = 0.8;
    label.layer.borderColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9] CGColor];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:fountSize];
    [superView addSubview:label];
    return label;
}
-(UIButton *)buttonWithSuperView:(UIView *)superView action:(SEL)action title:(NSString *)title imageName:(NSString *)imageName titleColor:(UIColor *)titleColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor blackColor];
    button.layer.cornerRadius = 18;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.alpha = 0.8;
    button.layer.borderColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.9] CGColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [superView addSubview:button];
    if (action) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [self addSubview:button];
    return button;
}





@end
