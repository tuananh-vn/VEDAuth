//
//  GCVETVHelpManager.m
//  FloatLib
//
//  Created by admin on 11/22/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "GCVETVHelpManager.h"
#import "GCVETVHelpController.h"

#import <CommonCrypto/CommonHMAC.h>

#import "NSData+Conversion.h"

@interface GCVETVHelpManager()
@property(nonatomic, strong) GCVETVHelpController *floatController;
@end


@implementation GCVETVHelpManager

+ (id)sharedManager {
    static GCVETVHelpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedMyManager = [[self alloc] init];
        sharedMyManager.appid = nil;
        sharedMyManager.tokenID = nil;
        [sharedMyManager initHelpManager: CGRectMake(10, 10, 50, 50)];
    });
    return sharedMyManager;
}

+ (id)sharedManagerWithFrame: (CGRect) frame{
    static GCVETVHelpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.appid = nil;
        sharedMyManager.tokenID = nil;
        [sharedMyManager initHelpManager: frame];
    });
    return sharedMyManager;
}

+ (id)sharedManagerForAppID: (NSString *) appid andAccessToken:(NSString *)tokenID{
    static GCVETVHelpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.appid = appid;
        sharedMyManager.tokenID = tokenID;
        
        [sharedMyManager initHelpManager: CGRectMake(10, 10, 50, 50)];
    });
    return sharedMyManager;
}

+ (id)sharedManagerForAppID: (NSString *) appid andAccessToken:(NSString *)tokenID andFrame: (CGRect) frame{
    static GCVETVHelpManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.appid = appid;
        sharedMyManager.tokenID = tokenID;
        [sharedMyManager initHelpManager: frame];
    });
    return sharedMyManager;
}

- (void) initHelpManager: (CGRect) frame; {
    self.floatWindow = [[UIWindow alloc] initWithFrame:frame];
    self.floatWindow.backgroundColor = [UIColor clearColor];
    self.floatWindow.windowLevel = UIWindowLevelAlert;
    _floatController = [[GCVETVHelpController alloc] initWithNibName:nil bundle:nil frame:self.floatWindow.frame];
    _floatController.view.backgroundColor = [UIColor clearColor];
    _floatController.delegate = self;
    self.floatWindow.rootViewController = _floatController;
}

- (void) setHelpImage: (UIImage *) image{
    self.floatController.helpIcon.image = image;
}

- (void) showHelp {
    [self.floatWindow makeKeyAndVisible];
}

- (void) hideHelp {
    self.floatWindow.hidden = YES;
}

-(void) helpOnClick {
    self.floatWindow.hidden = YES;
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    UINavigationController *webBrowserNavigationController = [KINWebBrowserViewController navigationControllerWithWebBrowser];
    [mainWindow.rootViewController presentViewController:webBrowserNavigationController animated:YES completion:nil];
    
    KINWebBrowserViewController *webBrowser = [webBrowserNavigationController rootWebBrowser];
    webBrowser.delegate = self;
    [webBrowser loadRequest:[self createHelpRequest]];
    
}


#pragma Webview Delegate
- (void)webBrowser:(KINWebBrowserViewController *)webBrowser didStartLoadingURL:(NSURL *)URL {
    NSLog(@"start loading %@", URL.absoluteString);
}
- (void)webBrowser:(KINWebBrowserViewController *)webBrowser didFinishLoadingURL:(NSURL *)URL {
    NSLog(@"finish loading %@", URL.absoluteString);
    
}
- (void)webBrowser:(KINWebBrowserViewController *)webBrowser didFailToLoadURL:(NSURL *)URL error:(NSError *)error {
    NSLog(@"failed loading %@", error.description);
    
}
- (void)webBrowserViewControllerWillDismiss:(KINWebBrowserViewController*)viewController {
    [self showHelp];
}


#pragma Encode data
-(NSString *) createChecksumWithData: (NSString*) data andStamp: (NSString *) stamp {
    NSString * parameters = [NSString stringWithFormat:@"%@%@", data, stamp];
    NSString *salt;
    if(self.salt) {
        salt = self.salt;
    } else {
        salt = DEFAULT_SALT;
    }
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* hash = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, saltData.bytes, saltData.length, paramData.bytes, paramData.length, hash.mutableBytes);
    NSString *base64Hash = [hash hexadecimalString];
    return base64Hash;
}

-(NSMutableURLRequest *) createHelpRequest {
    NSString *defaultURL = DEFAULT_URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:(self.serverURL ? _serverURL : defaultURL) ]];
    if(self.tokenID) {
        NSDictionary * postParams = [self createDictionary];
        NSString *postString = [self convertDictionaryToString:postParams];
        NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSString *postLength                = [NSString stringWithFormat:@"%lu", [postData length]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        request.HTTPBody = postData;
    } else {
        [request setHTTPMethod:@"GET"];
    }
    return request;
}

-(NSString *) createHelpData {
    int timestamp = (int)[[NSDate date] timeIntervalSince1970];
    NSString * timeStamp = [NSString stringWithFormat:@"%d",timestamp];
//    NSString * timeStamp = TimeStamp;
    NSString * checkSum = [self createChecksumWithData: self.tokenID andStamp: timeStamp];
    return [NSString stringWithFormat:@"access_token=%@&timestamp=%@&checksum=%@",self.tokenID, timeStamp, checkSum];
}

-(NSDictionary *) createDictionary {
    NSMutableDictionary *param;
    if(self.extraData) {
        param = [[NSMutableDictionary alloc] initWithDictionary:self.extraData];
    } else {
        param = [[NSMutableDictionary alloc] init];
    }
    int timestamp = (int)[[NSDate date] timeIntervalSince1970];
    NSString * timeStamp = [NSString stringWithFormat:@"%d",timestamp];
    NSString * checkSum = [self createChecksumWithData: self.tokenID andStamp: timeStamp];
    [param setValue:self.tokenID forKey:@"access_token"];
    [param setValue:timeStamp forKey:@"timestamp"];
    [param setValue:checkSum forKey:@"checksum"];
    
    if(self.redirectURL) {
        [param setValue:self.redirectURL forKey:@"redirect_url"];
    }
    return param;
}

-(NSString *) convertDictionaryToString: (NSDictionary *) params {
    NSMutableArray *pairArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *key in params)
        [pairArray addObject:[NSString stringWithFormat:@"%@=%@", key, params[key]]];
    return [pairArray componentsJoinedByString:@"&"];
}

@end
