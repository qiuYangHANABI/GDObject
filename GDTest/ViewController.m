//
//  ViewController.m
//  GDTest
//
//  Created by 黃秋陽 on 2018/6/29.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "ViewController.h"
#import "SingleObject.h"

@interface ViewController ()

@property (nonatomic, strong)SingleObject *singleObject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _singleObject = [SingleObject sharedMemory];
    NSLog(@"-------------first%@", _singleObject);
    
    _singleObject.name = @"newName";
    _singleObject.age = @"newAge";
    _singleObject.sex = @"newSex";
    [_singleObject saveData];
    NSLog(@"-------------second%@", _singleObject);
    
    [_singleObject resetData];
    NSLog(@"-------------third%@", _singleObject);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
