//
//  GCVETVHelpController.m
//  FloatLib
//
//  Created by admin on 11/18/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "GCVETVHelpController.h"

@interface GCVETVHelpController ()

@end

@implementation GCVETVHelpController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil frame: (CGRect) frame{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.frame = frame;
        [self initView];
    }
    
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initView];
    }
    
    
    return self;
}

- (void) initView {
    CGRect helpFrame = self.view.frame;
    helpFrame.origin = CGPointZero;
    _helpIcon = [[UIImageView alloc] initWithFrame:helpFrame];
    _helpIcon.contentMode = UIViewContentModeScaleAspectFit;
    _helpIcon.image = [UIImage imageNamed:@"ic_help"];
    
    _helpIcon.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    [tapGesture setDelegate:self];
    
    [_helpIcon addGestureRecognizer:tapGesture];
    
    
    [self.view addSubview:_helpIcon];
}
- (void) tapGesture: (id)sender
{
//    NSLog(@"Press help icon");
    if(self.delegate) {
        [self.delegate helpOnClick];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
