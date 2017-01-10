//
//  GCVETVHelpManager.h
//  FloatLib
//
//  Created by admin on 11/22/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "KINWebBrowserViewController.h"

#define TimeStamp [NSString stringWithFormat:@"%d",[[NSDate date] timeIntervalSince1970]];
#define DEFAULT_URL @"http://test.ved.com.vn/hotro/app-auth";
#define DEFAULT_SALT @"LinhDepTrai";
@protocol GCVETVHelpDelegate

-(void) helpOnClick;

@end



@interface GCVETVHelpManager : NSObject<GCVETVHelpDelegate, KINWebBrowserDelegate>


// appid from SSO system
@property(nonatomic, strong) NSString *appid;
// token id from GM.
@property(nonatomic, strong) NSString *tokenID;
// salt 
@property(nonatomic, strong) NSString *salt;
// salt
@property(nonatomic, strong) NSString *redirectURL;
// float window layer
@property(nonatomic, strong) UIWindow *floatWindow;

// server url
@property(nonatomic, strong) NSString *serverURL;

// extra data
@property(nonatomic, strong) NSDictionary *extraData;
+ (id) sharedManager;
+ (id)sharedManagerWithFrame: (CGRect) frame;
+ (id) sharedManagerForAppID: (NSString *) appid andAccessToken: (NSString *) tokenID;
+ (id) sharedManagerForAppID: (NSString *) appid andAccessToken:(NSString *)tokenID andFrame: (CGRect) frame;
- (void) showHelp;
- (void) hideHelp;
- (void) setHelpImage: (UIImage *) image;
@end
