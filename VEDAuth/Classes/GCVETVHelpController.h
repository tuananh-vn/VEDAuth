//
//  GCVETVHelpController.h
//  FloatLib
//
//  Created by admin on 11/18/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCVETVHelpManager.h"


@interface GCVETVHelpController : UIViewController <UIGestureRecognizerDelegate>
@property(nonatomic, assign) id<GCVETVHelpDelegate> delegate;
@property(nonatomic, strong) UIImageView* helpIcon;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil frame: (CGRect) frame;
@end
