//
//  DWScrollView.h
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/14.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface DWScrollView : UIScrollView
@property (nonatomic, copy) void (^birthdayView) ();
@property (nonatomic, copy) void (^settingClick) ();
@property (nonatomic, copy) void (^stopClick) ();
@property (nonatomic, copy) void (^emitClick) ();


@end
