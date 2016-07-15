//
//  DWCartoonView.m
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/15.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import "DWCartoonView.h"
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
@interface DWCartoonView ()
{
    int _countingdown_time;
    NSTimer *_countingdown_timer;
}

@end


@implementation DWCartoonView

-(void)cortoonInitialize:(UIView*)view{
    self.frame= CGRectMake(0, 0,WIDTH , HEIGHT);
    [view addSubview:self];
    
}

-(void)startCountingDown:(int)time
{
    _countingdown_time = time;
    _countingdown_timer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countingDown) userInfo:nil repeats:YES];
}
-(void)countingDown
{
    if(_countingdown_time<1)
    {
        [_countingdown_timer invalidate];
        return;
    }
    UILabel* label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"%d",_countingdown_time];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:50];
    [label sizeToFit];
    [label setTextColor:[UIColor whiteColor]];
    label.center = self.center;
    [self addSubview:label];
    [self viewteWithDuration:label];
    _countingdown_time --;
}
-(void)viewteWithDuration:(UILabel*)label{
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         label.alpha = 0;
         label.transform = CGAffineTransformMakeScale(1.5, 1.5);
     }completion:^(BOOL finish){
    [UIView animateWithDuration:3 animations:^{
      label.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }completion:^(BOOL finish){
    [UIView animateWithDuration:3
    animations:^{
        label.transform = CGAffineTransformMakeScale(0.8, 0.8);
    }completion:^(BOOL finish){
    }];
    }];
    }];
}


#pragma mark 送花动画
-(void)animation:(NSString*)imageString loginString:(NSString*)loginString initialPosition:(CGRect)initialPosition{
    UIImageView*img=[[UIImageView alloc]initWithFrame:initialPosition];
    UILabel*loginLabel=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2+32, HEIGHT/3+32,68,83)];
    loginLabel.text=loginString;
    loginLabel.textColor=RGB(255, 226, 2);
    loginLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    img.image=[UIImage imageNamed:imageString];
    [self addSubview:img];
    [self addSubview:loginLabel];
    loginLabel.hidden=YES;
    
    [UIView animateWithDuration:1 animations:^{
        img.frame = CGRectMake(WIDTH/2-32, HEIGHT/3+32,68,83);
    } completion:^(BOOL finished) {
        
    }];
    double duration =0.6;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        loginLabel.hidden=NO;
    });
    [UIView animateWithDuration:1.5f animations:^{
        img.alpha = 0.0f;
        
    }];
    [UIView animateWithDuration:1.8f animations:^{
        
        loginLabel.alpha = 0.0f;
    }];
}

@end
