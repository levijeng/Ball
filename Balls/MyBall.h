//
//  MyBall.h
//  UIView
//
//  Created by 鄭力瑋 on 2015/12/31.
//  Copyright © 2015年 鄭力瑋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyBall : NSObject
@property CGFloat ballX, ballY;
@property int intImage;
-(id)initWithX:(CGFloat)x andY:(CGFloat)y andImage:(int)img andViewWidth:(CGFloat)w andViewHeight:(CGFloat)h;
@end
