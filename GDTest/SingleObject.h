//
//  SingleObject.h
//  GDTest
//
//  Created by 黃秋陽 on 2018/6/29.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleObject : NSObject<NSCoding>

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *age;
@property (nonatomic, copy)NSString *sex;

+ (NSString *)path;
+ (SingleObject *)sharedMemory;
- (void)saveData;
- (void)resetData;

@end
