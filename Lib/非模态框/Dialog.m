//
//  dialogView.m
//  常用控件
//
//  Created by chen cheng on 14-4-28.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import "Dialog.h"


@interface DialogSuperView : UIView

@end

@interface DialogViewController : UIViewController
{
    UIView          *_dialogView;
    DialogSuperView *_dialogSuperView;
    BOOL            _modal;
}

- (void)setDialogView:(UIView *)dialogView;

@property(readonly, nonatomic)UIView   *dialogView;

@end


@interface DialogViewControllerView : UIView

@end


static UIWindow *g_alertWindow = nil;

@implementation DialogViewControllerView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CloseDialogView(QFCloseDialogViewAnimationNone, nil);
}

@end


@implementation DialogSuperView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end


@implementation DialogViewController

@synthesize dialogView = _dialogView;

- (void)dealloc
{
    [_dialogSuperView release];
    _dialogSuperView = nil;
    
    [_dialogView release];
    _dialogView = nil;
    
    [super dealloc];
}


- (id)initWithModal:(BOOL)modal
{
    self = [super init];
    if (self != nil)
    {
        _modal = modal;
    }
    
    return self;
}


- (void)loadView
{
    [super loadView];
    
    if (!_modal)
    {
        self.view = [[[DialogViewControllerView alloc] init] autorelease];
    }
}


- (void)setDialogView:(UIView *)dialogView
{
    [dialogView retain];
    [_dialogView removeFromSuperview];
    [_dialogView release];
    _dialogView = dialogView;
    
    if (_dialogSuperView == nil)
    {
        _dialogSuperView = [[DialogSuperView alloc] init];
    }
    
    
    dialogView.frame = dialogView.bounds;
    _dialogSuperView.frame = dialogView.bounds;
    
    float  mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    float  mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (orientation == UIInterfaceOrientationLandscapeLeft
        ||
        orientation == UIInterfaceOrientationLandscapeRight)
    {
        _dialogSuperView.center = CGPointMake(mainScreenHeight/2.0, mainScreenWidth/2.0);
    }
    else
    {
        _dialogSuperView.center = CGPointMake(mainScreenWidth/2.0, mainScreenHeight/2.0);
    }
    
    [_dialogSuperView addSubview:_dialogView];
    
    [self.view addSubview:_dialogSuperView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    float  mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    float  mainScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
        ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        _dialogSuperView.center = CGPointMake(mainScreenHeight/2.0, mainScreenWidth/2.0);
    }
    else
    {
        _dialogSuperView.center = CGPointMake(mainScreenWidth/2.0, mainScreenHeight/2.0);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0)
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end




void ShowDialogView(UIView *view, BOOL modal, QFShowDialogViewAnimationOptions showDialogViewAnimationOption, void (^completion)(BOOL finished))
{
    if (g_alertWindow == nil)
    {
        g_alertWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        g_alertWindow.windowLevel = UIWindowLevelAlert;
        
        g_alertWindow.backgroundColor = [UIColor clearColor];
        
        [g_alertWindow makeKeyAndVisible];
    }
    else
    {
        NSArray  *subViews = [g_alertWindow subviews];
        for (int i=0; i<[subViews count]; i++)
        {
            UIView *subView = [subViews objectAtIndex:i];
            [subView removeFromSuperview];
        }
    }
    
    
    DialogViewController * dialogViewController = [[DialogViewController alloc] initWithModal:modal];
    
    g_alertWindow.hidden = YES;
    
    [dialogViewController setDialogView:view];
    
    
    switch (showDialogViewAnimationOption)
    {
        case QFShowDialogViewAnimationNone:
            
            g_alertWindow.hidden = NO;
            
            if (completion != nil)
            {
                completion(YES);
            }
            
            g_alertWindow.rootViewController = dialogViewController;
            
            [dialogViewController release];
            
            return;
            break;
            
        case QFShowDialogViewAnimationFromLeft:
            
            view.layer.transform = CATransform3DTranslate(view.layer.transform, -dialogViewController.view.frame.size.width, 0, 0);
//            return;
            break;
            
        case QFShowDialogViewAnimationFromTop:
            
            view.layer.transform = CATransform3DTranslate(view.layer.transform, 0, -dialogViewController.view.frame.size.height, 0);
            
            break;
            
        case QFShowDialogViewAnimationFromRight:
            
            view.layer.transform = CATransform3DTranslate(view.layer.transform, dialogViewController.view.frame.size.width, 0, 0);
            
            break;
            
        case QFShowDialogViewAnimationFromBottom:
            
            view.layer.transform = CATransform3DTranslate(view.layer.transform, 0, dialogViewController.view.frame.size.height, 0);
            
            break;
            
        case QFShowDialogViewAnimationFromCenter:
            
            view.layer.transform = CATransform3DScale(view.layer.transform, 0.001, 0.001, 1);
            
            break;
            
        default:
            break;
    }
    
    g_alertWindow.hidden = NO;
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        view.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
        completion(finished);
    }];
    
    g_alertWindow.rootViewController = dialogViewController;
    
    [dialogViewController release];
    
}

void CloseDialogView(QFCloseDialogViewAnimationOptions closeDialogViewViewAnimationOption, void (^completion)(BOOL finished))
{
    CATransform3D  transform;
    
    DialogViewController * dialogViewController = (DialogViewController *)(g_alertWindow.rootViewController);
    
    UIView  *dialogView = dialogViewController.dialogView;
    
    
    switch (closeDialogViewViewAnimationOption)
    {
        case QFCloseDialogViewAnimationNone:
            
            g_alertWindow.rootViewController = nil;
            [g_alertWindow release];
            g_alertWindow = nil;
            
            if (completion != nil)
            {
                completion(YES);
            }
            
            return;
            break;
            
        case QFCloseDialogViewAnimationToLeft:
            
            transform = CATransform3DTranslate(dialogView.layer.transform, -dialogViewController.view.frame.size.width, 0, 0);
            
            break;
            
        case QFCloseDialogViewAnimationToTop:
            
            transform = CATransform3DTranslate(dialogView.layer.transform, 0, -g_alertWindow.rootViewController.view.frame.size.height, 0);
            
            break;
            
        case QFCloseDialogViewAnimationToRight:
            
            transform = CATransform3DTranslate(dialogView.layer.transform, g_alertWindow.rootViewController.view.frame.size.width, 0, 0);
            break;
            
        case QFCloseDialogViewAnimationToBottom:
            transform = CATransform3DTranslate(dialogView.layer.transform, 0, g_alertWindow.rootViewController.view.frame.size.height, 0);
            break;
            
        case QFCloseDialogViewAnimationToCenter:
            transform = CATransform3DScale(dialogView.layer.transform, 0.001, 0.001, 1);
            break;
            
        default:
            break;
    }
    
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        dialogView.layer.transform = transform;
        
    } completion:^(BOOL finished) {
        
        g_alertWindow.rootViewController = nil;
        [g_alertWindow release];
        g_alertWindow = nil;
        
        completion(finished);
    }];
}




