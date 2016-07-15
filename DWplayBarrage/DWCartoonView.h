//
//  DWCartoonView.h
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/15.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWCartoonView : UIView

-(void)cortoonInitialize:(UIView*)view;//初始化
-(void)startCountingDown:(int)time;//开始倒计时 传计时时间
//送花动画
/*
 * @param imageString      图片名
 * @param loginString      计算的数字
 * @param initialPosition  初始位置

*/
-(void)animation:(NSString*)imageString loginString:(NSString*)loginString initialPosition:(CGRect)initialPosition;

@end
