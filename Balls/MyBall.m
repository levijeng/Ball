//
//  MyBall.m
//  UIView
//
//  Created by 鄭力瑋 on 2015/12/31.
//  Copyright © 2015年 鄭力瑋. All rights reserved.
//

#import "MyBall.h"
#import "math.h"

@interface MyBall()
{
    CGFloat dx, dy, viewWidth, viewHeight;
    NSTimer *timer; //球的timer是拿來改變自己的x,y值
}
@end

@implementation MyBall

-(id)initWithX:(CGFloat)x andY:(CGFloat)y andImage:(int)img andViewWidth:(CGFloat)w andViewHeight:(CGFloat)h{
    self = [self init];
    self.ballX = x; self.ballY = y;
    self.intImage = img;
    viewWidth = w; viewHeight = h;
    
    //避免邊界出現問題
    if (x<50/2){
        self.ballX = 0;
    }else if(x+40>w-40){
        self.ballX = w - 40;
    }
    if (y<50/2){
        self.ballY = 0;
    }else if(y+40>h-40){
        self.ballY = h - 40;
    }
    
    dx = 6 * cos (arc4random()%360);
    dy = 6 * sin (arc4random()%360);
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    
    return self;
    
}

-(void)run:(NSTimer *)timer{
    if (self.ballX<0||self.ballX+40>viewWidth){
        dx *= -1;
    }
    if (self.ballY<0||self.ballY+40>viewHeight){
        dy *= -1;
    }
    self.ballX += dx; self.ballY += dy;
}

@end
