//
//  Person.h
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/4/7.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

-(void)personDelegateWork;

@end


@interface Person : NSObject
{
    NSString *_name;
    NSString *_sex;
    NSString *_job;
    NSString *_native;
    NSString *_education;

}
@property(nonatomic,assign)id<PersonDelegate>delegate;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,copy)NSString *job;
@property(nonatomic,copy)NSString *native;
@property(nonatomic,copy)NSString *education;



-(void)eat;

-(void)sleep;

-(void)work;


@end
