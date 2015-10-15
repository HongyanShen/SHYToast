//
//  SHYToast.m
//  SHYToast
//
//  Created by hongyanshen on 15/10/15.
//  Copyright © 2015年 hongyanshen. All rights reserved.
//

#import "SHYToast.h"

#define TOAST_HEIGHT 21.f

@interface SHYToast () {
    BOOL flag;
}

@end

@implementation SHYToast

+ (instancetype)makeToast:(NSString *)msg position:(SHYToastPosition)pos duration:(float)duration {
    SHYToast * toast = [[SHYToast alloc] init];
    
    toast.msg = msg;
    toast.pos = pos;
    toast.duration = duration;
    
    [toast setValue:@(YES) forKey:@"flag"];
    
    return toast;
}

- (void)didMoveToSuperview {
    if (flag) {
        self.alpha = 1.f;
        [UIView animateWithDuration:_duration animations:^{
            self.alpha = 0.f;
        } completion:^(BOOL finished) {
            if (finished) {
                [self removeFromSuperview];
            }
        }];
    }
    
    flag = NO;
}

- (void)show {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    [window insertSubview:self atIndex:NSIntegerMax];
    
    self.text = _msg;
    self.backgroundColor = [UIColor grayColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = TOAST_HEIGHT / 2;
    self.textAlignment = NSTextAlignmentCenter;
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeLeading
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:window
                                                       attribute:NSLayoutAttributeLeading
                                                      multiplier:1.f
                                                        constant:8.f]];
    
    [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeTrailing
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:window
                                                       attribute:NSLayoutAttributeTrailing
                                                      multiplier:1.f
                                                        constant:-8.f]];
    
    [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1.f
                                                        constant:TOAST_HEIGHT]];
    
    switch (_pos) {
        case SHYToastPositionTop:
            [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:window
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.f
                                                                constant:28.f]];
            break;
            
        case SHYToastPositionMiddle:
            [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:window
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.f
                                                                constant:0.f]];
            break;
            
        case SHYToastPositionBottom:
            [window addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:window
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.f
                                                                constant:-28.f]];
            break;
            
        default:
            break;
    }
}


- (void)dealloc {
//#ifdef SHYTOAST_DEBUG_DISABLE
    NSLog(@"销毁toast");
//#endif
}

@end
