//
//  ViewController.m
//  keyBoard
//
//  Created by 陈晓军 on 2020/9/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*
 iOS14 转横屏后再转回竖屏
 通过通知返回的 键盘gcrect 有问题
  目前主要是发现X系列的刘海屏 上高度问题 需要适配
 以下是 纠正键盘高度代码
 */
-(void)keyboardWillShow:(NSNotification *)aNotification {

    NSDictionary *userInfo = [aNotification userInfo];
    NSValue * boardValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardRect = [boardValue CGRectValue];
    CGFloat boardHeight = keyBoardRect.size.height;
    BOOL isX =  YES; // 判断设备为X
    if (@available(iOS 14.0, *)) {
        if ( keyBoardRect.size.width == [UIScreen mainScreen].bounds.size.height && isX) {
            boardHeight += 43;
            /*
             boardWidth = xxx;
             originX = xxx;
             originY = xxx;
             */
        }
    }
}


@end
