//
//  SecondViewController.m
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/8/8.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UIButton *btn;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"2";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
     btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"block" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeButtonBGColore) name:@"change" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeButtonBGColore) name:@"change" object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeButtonBGColore) name:@"changeButtonBGColore" object:nil];
    
}

-(void)changeButtonBGColore
{
    
    
    NSLog(@"通知");
    
    [btn setBackgroundColor:[UIColor blackColor]];
    self.view.backgroundColor = [UIColor redColor];
}

//-(void)viewDidDisappear:(BOOL)animated
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"changeButtonBGColore" object:nil];
//}


-(void)setSecondBlock:(SecondBlock)secondBlock
{
    if (_secondBlcok!=secondBlock) {
        
        _secondBlcok = [secondBlock copy];
        
    }
}

-(SecondBlock)myBlock
{
    return _secondBlcok;
}

-(void)btnClick
{
    if (self.myBlock) {
        
        self.myBlock(@"1234");
        
    }else
    {
        NSLog(@"123");
    }
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
