//
//  ViewController.h
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/4/7.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FirstBlock)();

@interface ViewController : UIViewController
{
    FirstBlock _firstBlock;
}

-(void)setFirstBlock:(FirstBlock)firstBlock;
-(FirstBlock)firstBlock;

@end

