//
//  MyView.m
//  iOS006
//
//  Created by 鄭力瑋 on 2015/12/31.
//  Copyright © 2015年 鄭力瑋. All rights reserved.
//

#import "MyView.h"
#import "MyBall.h"

@interface MyView()
{
    CGContextRef context;
    CGFloat viewWidth, viewHeight;
    BOOL isInit;
    CGFloat bgRed, bgGreen, bgBlue;
//    CGFloat circleX, circleY, circleW, circleH;
    CGFloat dx, dy;
    NSTimer *timer; // 用來更新畫面使用的
    
//    MyBall *ball;  //    單一棵ball
//    CGImageRef image;  //一種球
    CGImageRef imgs[8];   //不同種球
    NSMutableArray *balls;
}
@end


@implementation MyView

// 觸控開始後的動作
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint touchLoc = [touch locationInView:self];
    CGFloat x = touchLoc.x;
    CGFloat y = touchLoc.y;
    
//    circleX = x - circleW/2;
//    circleY = y - circleH/2;
    
    CGFloat ballX = x - 40/2;
    CGFloat ballY = y - 40/2;
    
    // 單一棵ball
//    ball = [[MyBall alloc]initWithX:ballX andY:ballY andImage:0 andViewWidth:viewWidth andViewHeight:viewHeight];
    
    MyBall *ball = [[MyBall alloc]initWithX:ballX andY:ballY andImage:arc4random()%8 andViewWidth:viewWidth andViewHeight:viewHeight];
    [balls addObject:ball];
    
//    if(![timer isValid]){
//        [self setNeedsDisplay];
//    }
    
}

-(void)changeBGRed:(float)red andGreen:(float)green andBlue:(float)blue{
    bgRed =red; bgGreen = green; bgBlue = blue;
    [self setNeedsDisplay];
}

-(void)moveCircle{
    if (timer == nil){
        timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    }
}

//-(void)run:(NSTimer *)timer{
//    if (circleX<0 || circleX+circleW>viewWidth){
//        dx *= -1;
//    }
//    if (circleY<0 || circleY+circleH>viewHeight){
//        dy *= -1;
//    }
//    circleX += dx;
//    circleY += dy;
//    [self setNeedsDisplay];
//}

-(void)stopCircle{
    if ([timer isValid]){
        [timer invalidate];
        timer = nil;
    }
}

// 此段用來初始化畫面
- (void)drawInit:(CGRect)rect {
//    NSLog(@"Draw Rect");
    context = UIGraphicsGetCurrentContext();
    viewWidth = CGRectGetWidth(self.bounds); //亦可用self.bounds
    viewHeight = CGRectGetHeight(rect);
    //    NSLog(@"w:%f h:%f",viewWidth, viewHeight);
    
    bgRed = bgGreen = bgBlue = 0;
//    circleX = circleY = 0;
//    circleW = circleH = 40;
    dx = dy = 6;
    
    balls = [NSMutableArray array];
//    image = [UIImage imageNamed:@"ball"].CGImage; //單一種image的球
    imgs[0] = [UIImage imageNamed:@"ball"].CGImage;
    imgs[1] = [UIImage imageNamed:@"ball1"].CGImage;
    imgs[2] = [UIImage imageNamed:@"ball2"].CGImage;
    imgs[3] = [UIImage imageNamed:@"ball3"].CGImage;
    imgs[4] = [UIImage imageNamed:@"ball4"].CGImage;
    imgs[5] = [UIImage imageNamed:@"ball5"].CGImage;
    imgs[6] = [UIImage imageNamed:@"ball5"].CGImage;
    imgs[7] = [UIImage imageNamed:@"ball6"].CGImage;
    
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(run:) userInfo:nil repeats:YES];
    
    isInit = YES;
}

-(void)run:(NSTimer *)timer{
    [self setNeedsDisplay];
}

//處理呈現的畫面
- (void)drawRect:(CGRect)rect {
    if(!isInit) [self drawInit:rect];
    
    
    CGContextSaveGState(context);

    //繪圖
    CGContextSetRGBFillColor(context, bgRed, bgGreen, bgBlue, 1);
    CGContextAddRect(context, CGRectMake(0, 0, viewWidth, viewHeight));
    CGContextDrawPath(context, kCGPathFill);
    
    //畫線
//    CGContextSetLineWidth(context, 4);
//    CGContextSetRGBStrokeColor(context, arc4random()%11 * 0.1, arc4random()%11 * 0.1, arc4random()%11 * 0.1, 1);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 200, 200);
//    CGContextDrawPath(context, kCGPathStroke);
    
//    //畫圓
//    CGContextSetRGBFillColor(context, arc4random()%11 * 0.1, arc4random()%11 * 0.1, arc4random()%11 * 0.1, 1);
//    CGContextAddEllipseInRect(context, CGRectMake(circleX, circleY, circleW, circleH));
//    CGContextDrawPath(context, kCGPathFill);
    
    //畫影像UIImage
//    UIImage *uimg = [UIImage imageNamed:@"ball"];
//    CGImageRef image = uimg.CGImage;
//    CGContextDrawImage(context, CGRectMake(circleX, circleY, circleW, circleH), image);
    
//    單一棵ball
//    if(ball != nil){
//    CGContextDrawImage(context, CGRectMake(ball.ballX, ball.ballY, 40, 40), image);
//    }
    
    if([balls count]>0){
        for (MyBall *ball in balls){
            CGContextDrawImage(context, CGRectMake(ball.ballX, ball.ballY, 40, 40), imgs[ball.intImage]);}
    }

    
    
    //還原
    CGContextRestoreGState(context);
}

@end
