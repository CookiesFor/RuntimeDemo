//
//  ViewController.m
//  RuntimeDemo
//
//  Created by SIMPLE PLAN on 16/4/7.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()<PersonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //获取类中的成员变量
//    [self runtimeTest];
    
    //获取类中的方法
//    [self runtimeTest2];
    
    //获取一个类遵循的协议
//    [self runtimeTest3];
    
    
    //解归档
    [self runtimeTest4];
    
    
    int a = 1;
    int b = 3;
    
//    a = a+b;
//    b = a-b;
//    a = a-b;
//    NSLog(@"a:%d,b:%d",a,b);
    
    a = a^b;
    b = a^b;
    a = a^b;
    NSLog(@"a:%d,b:%d",a,b);
}

//获取一个类的所有成员变量名
-(void)runtimeTest
{
    unsigned int count;
    
    //获取成员变量的结构体
    Ivar *vars = class_copyIvarList([Person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = vars[i];
        //根据ivar获取其他成员变量的名称
        const char *name = ivar_getName(ivar);
        //将C的字符串转换为OC的
        NSString *key = [NSString stringWithUTF8String:name];
    
        NSLog(@"%@",key);
    }
    //释放
    free(vars);
}

//获取一个类的全部方法
-(void)runtimeTest2
{
    unsigned int count;
    //获取指向该类所有方法的指针
    Method *methods = class_copyMethodList([Person class], &count);
    
    for (int i = 0; i<count; i++) {
        //获取该类的一个方法的指针
        Method method = methods[i];
        //获取方法
        SEL methodSEL = method_getName(method);
        //将方法转换为C字符串
        const char *name = sel_getName(methodSEL);
        //将C字符串转换为OC字符串
        NSString *methodName = [NSString stringWithUTF8String:name];
        
        //获取方法参数个数
        int arguments = method_getNumberOfArguments(method);
        NSLog(@"%d -- %@ -- %d",i,methodName,arguments);
    }
    //释放
    free(methods);

}

//获取一个类遵循的所有协议
-(void)runtimeTest3
{
    unsigned int count;
    
    //获取指向该类遵循的所有协议的指针
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([self class], &count);
    
    for (int i = 0; i<count; i++) {
        //获取该类遵循的一个协议指针
        Protocol *protocol = protocols[i];
        //获取C字符串协议名
        const char *name = protocol_getName(protocol);
        //C字符串转为OC字符串
        NSString *protocolName = [NSString stringWithUTF8String:name];
        NSLog(@"协议:%d -- %@",i,protocolName);
    }

    //释放
    free(protocols);
    
}

//归档，解档

-(void)runtimeTest4
{
    Person *person = [[Person alloc]init];
    person.name = @"郭振伟";
    person.sex = @"男";
    person.job = @"iOS r&d engineers";
    person.native = @"河南";
    person.education = @"本科";
    //存储在本地沙盒内,创建路径
    NSString *path = [NSString stringWithFormat:@"%@/archive",NSHomeDirectory()];
    //归档，保存在刚创建的路径内
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    //解档,存的是什么类型，解档出来还是用什么类型来接收
    Person *unarchivePerson = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"unarchivePerson == %@ %@",path,unarchivePerson);
    
    NSLog(@"%@",unarchivePerson.name);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
