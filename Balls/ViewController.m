//
//  ViewController.m
//  iOS006
//
//  Created by 鄭力瑋 on 2015/12/31.
//  Copyright © 2015年 鄭力瑋. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
{
    MyView *gameView;
}
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController
- (IBAction)changeBGColor:(id)sender {
    [self.myView changeBGRed:arc4random()%11 * 0.1 andGreen:arc4random()%11 * 0.1 andBlue:arc4random()%11 * 0.1];
}
- (IBAction)moveCircle:(id)sender {
    [gameView moveCircle];
}

- (IBAction)stopCircle:(id)sender {
    [gameView stopCircle];
}

//只有在上層的MyView沒有在做touchesBegan, 才會讓下層的ViewController執行
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"ViewController:%d", arc4random()%100);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    gameView = self.myView;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
