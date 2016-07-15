//
//  AppDelegate.m
//  DWplayBarrage
//
//  Created by DUCHENGWEN on 16/7/7.
//  Copyright © 2016年 DUCHENGWEN. All rights reserved.
//

#import "AppDelegate.h"
#import "DWLiveVideoViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    DWLiveVideoViewController* LiveVideoView = [[DWLiveVideoViewController alloc] init];
    self.window.rootViewController = LiveVideoView;
    return YES;
}



@end
