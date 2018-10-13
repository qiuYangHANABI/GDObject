//
//  SingleObject.m
//  GDTest
//
//  Created by 黃秋陽 on 2018/6/29.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "SingleObject.h"

@implementation SingleObject

static SingleObject *instance;
//数据序列化
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_age forKey:@"age"];
    [aCoder encodeObject:_sex forKey:@"sex"];
}
//数据反序列化
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeObjectForKey:@"age"];
        _sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}
//获取存储路径
+ (NSString *)path{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *oldPath = [pathArray objectAtIndex:0];
    NSString *newPath = [oldPath stringByAppendingPathComponent:@"user.data"];
    return newPath;
}
//存储
- (void)saveData{
    [NSKeyedArchiver archiveRootObject:self toFile:[SingleObject path]];
}
//取出
+ (SingleObject *)sharedMemory{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([[NSFileManager defaultManager] fileExistsAtPath:[SingleObject path]]) {
            instance = [NSKeyedUnarchiver unarchiveObjectWithFile:[SingleObject path]];
        }else{
            instance = [[SingleObject alloc]init];
        }
    });
    return instance;
}
//重置
- (void)resetData{
    [[NSFileManager defaultManager] removeItemAtPath:[SingleObject path] error:nil];
    _name = @"defaultName";
    _age = @"defaultAge";
    _sex = @"defaultSex";
    [self saveData];
}
//NSLog
- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@ age:%@ sex:%@", _name, _age, _sex];
}



@end
