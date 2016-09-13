//
//  SecondViewController.h
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/8/8.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SecondBlock)(NSString *name);

@interface SecondViewController : UIViewController
{
    SecondBlock _secondBlcok;
}

-(void)setSecondBlock:(SecondBlock)secondBlock;
-(SecondBlock)myBlock;

@end
