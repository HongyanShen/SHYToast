//
//  SHYToast.h
//  SHYToast
//
//  Created by hongyanshen on 15/10/15.
//  Copyright © 2015年 hongyanshen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SHYToastPosition) {
    SHYToastPositionTop,
    SHYToastPositionMiddle,
    SHYToastPositionBottom
};

@interface SHYToast : UILabel

@property(copy, nonatomic) NSString * msg;

@property(assign, nonatomic) SHYToastPosition pos;

@property(assign, nonatomic) float duration;

+ (instancetype)makeToast:(NSString*)msg position:(SHYToastPosition)pos duration:(float)duration;

- (void)show;

@end
